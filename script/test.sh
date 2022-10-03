#!/bin/bash
# make chrome browser an env variable for test
export CHROME_BIN=/usr/bin/chromium-browser

# install nodejs version 12
curl -fsSL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

# install angular/ angular cli version 11.2.x
sudo npm install -g @angular/cli@11.2.x
cd frontend && cd spring-petclinic-angular
npm install --save-dev @angular/cli@11.2.x
rm -f package-lock.json
npm install

# run test using the chromedriver installed above
ng test --browsers=ChromeHeadless --watch=false