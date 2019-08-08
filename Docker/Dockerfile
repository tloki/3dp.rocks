# base image
FROM node

RUN apt-get update

#RUN apt install git

# install chrome for protractor tests
#RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
#RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
#RUN apt-get update && apt-get install -yq google-chrome-stable

# set working directory
RUN mkdir /usr/src/app
# maybe RUN apt install ng-common  ?
WORKDIR /usr/src/app

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install and cache app dependencies
#COPY package.json /usr/src/app/package.json
#RUN npm install
RUN npm install -g @angular/cli
RUN npm install connect serve-static
#@1.7.1

# add app
# must do: 
#     git clone https://github.com/MarkDurbin104/3dp.rocks.git 
# on Docker host
COPY 3dp.rocks /usr/src/app
COPY 3dp.rocks /tmp/3dp.rocks
RUN mv /tmp/3dp.rocks/lithophane/* /usr/src/app
RUN rm -rf /tmp/3dp.rocks

# TODO add this to separate file
RUN touch /usr/src/app/server.js
RUN echo "var connect = require('connect');" >> /usr/src/app/server.js
RUN echo "var serveStatic = require('serve-static');" >> /usr/src/app/server.js
RUN echo "connect().use(serveStatic(__dirname)).listen(10001, function(){" >> /usr/src/app/server.js
RUN echo "    console.log('Server running on 10001...');" >> /usr/src/app/server.js
RUN echo "});" >> /usr/src/app/server.js

RUN cat /usr/src/app/server.js

EXPOSE 10001
# start app
#CMD ng serve --host 0.0.0.0
CMD node server.js
