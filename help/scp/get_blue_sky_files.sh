#!/bin/bash

echo "In the get_blue_sky_files.sh script..."

# Copy files via SSH tunnel to current directory
scp -rP $UNUSED_PORT_ON_AEOLUS "${BSUSER}@127.0.0.1:/opt/bluesky/bluesky_3.5.1/" .

echo "... finished copying bluesky to cwd. End of get_blue_sky_files.sh script."
