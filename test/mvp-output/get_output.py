import docker
import time

IM_NAME='larairpact/bluesky-framework'

def main():
    client = docker.from_env()

    # need image if not pulled already
    client.images.pull(IM_NAME)
    
    # run and wait at the end
    # TODO > don't hardcode the date
    container = client.containers.run(
        IM_NAME,
        '/bluesky/dist/bluesky/base/lib/bluesky -d 2019090100Z -K no-archive defaultLAR_SFonly && sleep 60',
        detach=True)

    while True:
        try:
            # TODO
            # > this throwing weird error -- fix
            # > don't hardcode the date
            bits, stat = docker.APIClient.get_archive(
                container=container.id,
                path='/bluesky/dist/bluesky/output/2019090100.4')
            break
        except docker.errors.APIError:
            time.sleep(5)
            print("waiting for bluesky run to finish")
            continue

    print("stats: ", stat)

    # TODO > write bits to file for Garrett to access


if __name__ == "__main__":
    main()