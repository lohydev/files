mkdir octopus-deploy
cd octopus-deploy
curl -LO https://raw.githubusercontent.com/lohydev/files/master/octopus-deploy-docker-compose/docker-compose.yml
curl -LO https://raw.githubusercontent.com/lohydev/files/master/octopus-deploy-docker-compose/.env
sudo docker network create nat
sudo docker-compose --project-name Octopus up -d
