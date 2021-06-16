wget https://raw.githubusercontent.com/lohydev/files/master/k3os-cloud-init.yml -O cloud-init.yml
sed -i "s/my-k3os-host/$1/" cloud-init.yml
sed -i "s/my-k3os-password/$2/" cloud-init.yml
