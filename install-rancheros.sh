wget https://raw.githubusercontent.com/lohydev/files/master/rancheros-cloud-config.yml -O cloud-config.yml
sed -i "s/my-rancher/$1/" cloud-config.yml
sudo ros install -c cloud-config.yml -d /dev/sda --append "rancher.password=$2" --append "rancher.autologin=tty1"
