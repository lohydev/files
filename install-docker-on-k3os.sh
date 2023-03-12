curl -LO https://download.docker.com/linux/static/stable/x86_64/docker-20.10.9.tgz
tar xzvf docker-20.10.9.tgz
sudo mv docker/* /usr/local/bin/
rm -rf docker/ docker-20.10.9.tgz
cat <<EOF | sudo tee /var/lib/rancher/k3os/config.yaml
run_cmd:
- "dockerd &"
EOF
sudo reboot
