  FROM readytalk/nodejs
  MAINTAINER Zobair

  ## Change to your project repo https://username@github.com/username/repo_name.git
  ENV GITURL "https://github.com/zmsp/node-js-sample"
  WORKDIR /app
  RUN git clone $GITURL 
  ENTRYPOINT cd /app/*/ && git pull && npm install && npm start
