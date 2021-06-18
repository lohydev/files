sudo apt update
sudo apt upgrade -y
sudo snap install microk8s --classic --edge
sleep 2m
sudo microk8s.enable dns storage ingress helm3
sudo sh -c 'echo "--allow-privileged=true" >> /var/snap/microk8s/current/args/kube-apiserver'
sudo systemctl restart snap.microk8s.daemon-apiserver.service
sleep 2m
sudo microk8s.helm3 repo add rancher-latest https://releases.rancher.com/server-charts/latest
sudo microk8s.kubectl create namespace cattle-system
sudo microk8s.kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.0.4/cert-manager.crds.yaml
sudo microk8s.kubectl create namespace cert-manager
sudo microk8s.helm3 repo add jetstack https://charts.jetstack.io
sudo microk8s.helm3 repo update
sudo microk8s.helm3 install cert-manager jetstack/cert-manager --namespace cert-manager --version v1.0.4
sleep 4m
rancherHostname="${HOSTNAME}.local"
sudo microk8s.helm3 install rancher rancher-latest/rancher --namespace cattle-system --set hostname=$rancherHostname
hostsLine="127.0.0.1\t$rancherHostname"
sudo -- sh -c -e "echo '$hostsLine' >> /etc/hosts"
