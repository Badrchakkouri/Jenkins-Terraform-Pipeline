#!/bin/bash
sudo apt-get -y update
sudo apt-get -y install nginx
cd /var/www/html
sudo mv index.html index.html.old
sudo echo "
<h1 style=\"text-align: center;\"><span>Badr says hello from AWS EC2!&nbsp;</span><span></span></h1>
<p><span><img src=\"https://media.giphy.com/media/xT9IgG50Fb7Mi0prBC/giphy.gif\" alt=\"\" width=\"400\" height=\"200\" style=\"display: block; margin-left: auto; margin-right: auto;\" /></span></p>
" > index.html
sudo chmod 644 index.html
sudo systemctl restart nginx
