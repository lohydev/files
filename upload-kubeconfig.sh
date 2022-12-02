# curl https://raw.githubusercontent.com/lohydev/files/master/upload-kubeconfig.sh | bash

KUBECONFIG_PATH="/etc/rancher/k3s/k3s.yaml"

cp $KUBECONFIG_PATH kubeconfig

ip_address=$(ip route get 1.2.3.4 | awk '{print $7}'
ip_address=`echo $ip_address | sed 's/ *$//g'`
sed -i "s/127.0.0.1/$ip_address/" kubeconfig

upload_kubeconfig_url=$(curl --data "text=$(base64 kubeconfig)" https://file.io | grep -Eo '(http|https)://[a-zA-Z0-9./?=_%:-]*')
echo "Please send this url to GV personnel: $upload_kubeconfig_url"

rm -rf kubeconfig
