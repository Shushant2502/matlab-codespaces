#! /bin/bash

until printf "" 2>>/dev/null >>/dev/tcp/localhost/8888; 
do 
    echo "Waiting for port 8888 to initialize "
    sleep 1;
done


echo " Port 8888 is active, starting web-desktop"
# Open MATLAB web-desktop in another tab
sensible-browser http://localhost:8888
