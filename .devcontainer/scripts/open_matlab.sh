#! /bin/bash

until printf "" 2>>/dev/null >>/dev/tcp/localhost/8888; 
do 
    echo "Waiting for port 8888 to initialize "
    sleep 1;
done


# Open browser only once
# https://github.com/microsoft/vscode-dev-containers/blob/master/containers/codespaces-linux/.devcontainer/setup-user.sh
if [ -t 1 ] && [ ! -f /tmp/first-run-notice ]; then
  touch /tmp/first-run-notice
  echo "Port 8888 is active, starting web-desktop"
  # Open MATLAB web-desktop in another tab
  sensible-browser http://localhost:8888
fi
