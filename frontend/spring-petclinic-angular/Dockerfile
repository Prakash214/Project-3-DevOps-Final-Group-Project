FROM node:12
WORKDIR /app
COPY . /app
RUN npm install
RUN npm install -g @angular/cli@11.2.x
EXPOSE 4200
ENTRYPOINT ng serve --host 0.0.0.0 --port 4200 --disableHostCheck true