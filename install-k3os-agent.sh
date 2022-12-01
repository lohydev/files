# wget https://raw.githubusercontent.com/lohydev/files/master/install-k3os-agent.sh | bash -s my-k3os-host my-k3os-password my-main-master

wget https://raw.githubusercontent.com/lohydev/files/master/k3os-agent-cloud-init.yml -O cloud-init.yml
sed -i "s/my-k3os-host/$1/" cloud-init.yml
sed -i "s/my-k3os-password/$2/" cloud-init.yml
sed -i "s/my-main-master/$3/" cloud-init.yml
sudo k3os install
