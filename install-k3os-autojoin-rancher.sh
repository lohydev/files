wget https://raw.githubusercontent.com/lohydev/files/master/k3os-cloud-config.yml -O cloud-config.yml
sed -i "s/my-k3os-host/$1/" cloud-config.yml
sed -i "s/my-k3os-password/$2/" cloud-config.yml
sed -i "s/my-rancher-server/$3/" cloud-config.yml
sed -i "s/my-rancher-password/$4/" cloud-config.yml
sudo k3os install -c cloud-config.yml -d /dev/sda
