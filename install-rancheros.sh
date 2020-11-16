wget https://raw.githubusercontent.com/lohydev/files/master/rancheros-cloud-config.yml -O cloud-config.yml
sed -i "s/my-rancheros/$1/" cloud-config.yml
sudo ros install -c cloud-config.yml -d /dev/sda
