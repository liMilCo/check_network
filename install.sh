echo "#!/bin/bash" > /home/check_network
echo "x=\`ping -c1 google.com 2>&1 | grep unknown\`" >> /home/check_network
echo "LOGFILE=\"/home/check_network.log\"" >> /home/check_network
echo "TIMESTAMP=\`date \"+%Y-%m-%d %H:%M:%S"\`\"" >> /home/check_network
echo "if [ ! \"\$x\" = \"\" ]; then" >> /home/check_network
echo " echo \"Net is down!! Attempting to restart at \$TIMESTAMP.\"" >> /home/check_network
echo " systemctl restart systemd-networkd" >> /home/check_network
echo "fi" >> /home/check_network
chmod +x /home/check_network

echo "#Network Restart" > /home/check_network.log


echo "*/2 * * * * root  /home/check_network >> /home/check_network.log 2>&1" > /etc/cron.d/check_network_or_rst
echo "0 * * * *   root  systemctl restart systemd-networkd  > /dev/null" >> /etc/cron.d/check_network_or_rst
