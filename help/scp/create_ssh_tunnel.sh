#!/bin/bash

# Create an SSH tunnel from localhost to Aeolus to BlueSky Server
ssh -L "${UNUSED_PORT_ON_AEOLUS}:${BLUENODE}:${SCP_PORT}" "${BSUSER}@${AEOLUSHPCC}" cat