#!/usr/bin/env bash
# Bash script that sets up your web servers for the deployment of web_static
# Install Nginx if it not already installed
if [ ! -x /usr/sbin/nginx ]
then
    sudo apt-get -y update
    sudo apt-get -y install nginx
fi
sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/
sudo touch /data/web_static/releases/test/index.html
echo "<html>
  <head>
  </head>
  <body>
     Holberton School
  </body>
</html>" | sudo tee /data/web_static/releases/test/index.html
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
sudo chown -R ubuntu:ubuntu /data
sudo chmod -R 755 /data/

sudo sed -i '19 i\\n    location /hbnb_static/ {\n        alias /data/web_static/current/;\n    }\n' /etc/nginx/sites-available/default

sudo service nginx restart

