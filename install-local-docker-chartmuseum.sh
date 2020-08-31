sudo docker run -d -p 5000:5000 --restart=unless-stopped registry:2
sudo docker run -d -p 8080:8080 --restart=unless-stopped -e STORAGE=local -e STORAGE_LOCAL_ROOTDIR=/charts -v $(pwd)/charts:/charts chartmuseum/chartmuseum
