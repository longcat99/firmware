yaml-cli -s .video0.size 1920x1080
yaml-cli -s .video0.crop 0x0x1920x1080
yaml-cli -s .video0.fps 90
yaml-cli -s .isp.sensorConfig /etc/sensors/imx415_fpv.bin
yaml-cli -s .isp.exposure 30
sleep .2
/root/kill.sh
