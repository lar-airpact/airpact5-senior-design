# Copying Files From BlueSky to Your Computer

1. Open two terminals to this directory. Set up environment variables in both terminals. Make sure to change to your username.
```
export AEOLUSHPCC=aeolus.wsu.edu
export BSUSER=klitte
export UNUSED_PORT_ON_AEOLUS=17196
export SCP_PORT=22
export BLUENODE=10.1.1.28
```
2. In terminal #1, run:
```
./create_ssh_tunnel.sh
```
3. In terminal #2, run:
```
./get_blue_sky_files.sh
```

4. In terminal #1, end ```cat``` command with a Ctrl+D or Ctrl+C.