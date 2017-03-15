FROM node:boron

RUN npm install pm2 -g
RUN npm install serverless -g
RUN npm install pm2-gui -g

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app

RUN cd /usr/src/app

EXPOSE 8080 8088 3000

# CMD ["serverless", "offline"]
CMD ["npm", "run","serve"]
# CMD ["pm2-docker", "process.yml"]
# CMD pm2-gui agent /usr/src/app/config.ini