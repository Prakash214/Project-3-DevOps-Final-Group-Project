#! /bin/bash
cd front-end
# install nodejs
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt-get install -y nodejs

# install npm 
sudo apt-get install npm
sudo npm install -g @angular/cli
sudo npm install --save-dev @angular/cli@latest
rm ./frontend/spring-petclinic-angular/package-lock.json
sudo npm install
ng test