yaml-cli -s .video0.size 1280x720
yaml-cli -s .video0.crop 0x0x1280x720
yaml-cli -s .video0.fps 120
yaml-cli -s .isp.sensorConfig /etc/sensors/imx415_fpv.bin
yaml-cli -s .isp.exposure 30
sleep .2
/root/kill.sh
