import docker
import time

IM_NAME='larairpact/bluesky-framework'  # image to pull/run
DATE = '20190901'                       # date running BSF on
TIME_TO_GET_FROM_CONTAINER = 60         # seconds to allow program to extract data from docker container
POLLING_FREQUENCY = 5                   # seconds we wait before polling docker container to see if it finished its run

def poll_for_output(container):
    """Polls container for output
    """
    api_client = docker.APIClient()
    time_waited = 0

    while True:
        try:
            # as long as y'all don't recommit the container, directory will be 00.4 for this date
            # for a different date that doesn't exist in the container, will be 00.1
            bits, stat = api_client.get_archive(
                container=container.id,
                path='/bluesky/dist/bluesky/output/{date}00.4'.format(date=DATE))
            break
        except docker.errors.APIError:
            time.sleep(POLLING_FREQUENCY)
            time_waited += POLLING_FREQUENCY
            print("waited {wait_time} seconds for bluesky run to finish".format(wait_time=time_waited))
            continue

    return bits, stat


def stream_std(container):
    """Streams any output from container to its stdout, stderr
    """
    # stream stdout of container
    for line in container.logs(stream=True):
        line_string = line.strip().decode("utf-8")
        print(line_string)

        if 'ERROR' in line_string:
            raise Exception('Fuck')


def main():
    client = docker.from_env()

    # need image if not pulled already
    client.images.pull(IM_NAME)
    
    # run and wait at the end
    container = client.containers.run(
        IM_NAME,
        '/bluesky/dist/bluesky/base/lib/bluesky -d {date}00Z -K no-archive defaultLAR_SFonly && sleep {time_to_wait}'
            .format(date=DATE, time_to_wait=TIME_TO_GET_FROM_CONTAINER),
        detach=True)

    # stream the output for debugging purposes
    stream_std(container)

    # continously poll the container for output until we get it
    dirbits, dirstats = poll_for_output(container)
    print("stats: ", dirstats)

    # TODO > write bits to file for Garrett to access


if __name__ == "__main__":
    main()