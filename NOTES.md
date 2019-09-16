# General Notes

- This is the command that runs BlueSky currently on Aeolus. This is called within the BlueSky script on the Ubuntu Server:
```shell
$BS_DIR/bluesky -d ${YYYYMMDD}00Z -K no-archive defaultLAR_SFonly
```