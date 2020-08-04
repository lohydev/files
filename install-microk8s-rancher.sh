sudo apt update
sudo apt upgrade -y
sudo snap install microk8s --classic --edge
sleep 2m
sudo microk8s.enable dns storage ingress helm
sudo sh -c 'echo "--allow-privileged=true" >> /var/snap/microk8s/current/args/kube-apiserver'
sudo systemctl restart snap.microk8s.daemon-apiserver.service
sleep 2m
sudo microk8s.kubectl create serviceaccount tiller --namespace kube-system
sudo microk8s.kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
sudo microk8s.helm init --service-account=tiller
sudo microk8s.kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.9/deploy/manifests/00-crds.yaml
sudo microk8s.kubectl create namespace cert-manager
sudo microk8s.kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true
sleep 4m
sudo microk8s.helm repo add jetstack https://charts.jetstack.io
sudo microk8s.helm install --name cert-manager --namespace cert-manager --version v0.9.1 jetstack/cert-manager
sudo microk8s.helm repo add rancher-stable https://releases.rancher.com/server-charts/stable
