echo "#!/bin/bash" >> /home/check_network
echo "x=\"ping -c1 google.com 2>&1 | grep unknown\"" >> /home/check_network
echo "LOGFILE=\"/home/hiddify-panel/check_network.log\"" >> /home/check_network
echo "TIMESTAMP=`date "+%Y-%m-%d %H:%M:%S"`" >> /home/check_network
echo "if [ ! \"\$x\" = \"\" ]; then" >> /home/check_network
echo "&nbsp;&nbsp; echo \"Net is down!! Attempting to restart at $TIMESTAMP.\"" >> /home/check_network
echo "&nbsp;&nbsp; systemctl restart systemd-networkd" >> /home/check_network
echo "fi" >> /home/check_network
