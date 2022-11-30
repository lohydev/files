# wget https://raw.githubusercontent.com/lohydev/files/master/install-rancheros.sh | sh -s my-hostname my-host-rancher-password my-rancher-password

wget https://raw.githubusercontent.com/lohydev/files/master/rancheros-cloud-config.yml -O cloud-config.yml
sed -i "s/my-hostname/$1/" cloud-config.yml
sed -i "s/my-rancher-password/$3/" cloud-config.yml
echo 'Run this: sudo ros install -c cloud-config.yml -d /dev/sda --append "rancher.password=$2" --append "rancher.autologin=tty1"'
