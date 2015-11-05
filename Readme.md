# Docker Nodejs Git
Automatically pulls, updates, installs and runs github nodejs projects.

## Making a custom image using argument. 

### Customizing

File is located under  `/dokcer-nodejs/Docker1`
To use this run the following cmd

```
git clone https://github.com/zmsp/docker-nodejs.git
cd docker-nodejs-git/Docker1
docker build -t docker-nodejs-git .
docker run -e "GITURL=https://github.com/heroku/node-js-sample.git" docker-nodejs-git
```
Change GITURL to match your repository

Change the second github url to point to your nodejs project.
You can change startup command by editing/appending to the last line   
`ENTRYPOINT "cd /app/* && npm run dev"`

### What does it do?
The first time the container is ran: 

* it clones your project
* goes to your project directory
* runs npm install

Every time the container is ran: 

* Checks if your git repo is upto date
* If upto date, runs npm start
* If not, runs git pull, npm install, npm run


## Shipping your project with Dockerfile/ Publishing your nodejs app with docker
### Customizing
Edit the Dockerfile located under `/dokcer-nodejs/Docker2`
Simply change the   `ENV GITURL` to match the github repo in the `Dockerfile` and ship it with your project

### What does it do?
When you build the image:

* Clones the github project

Each time you start the container

* The docker image will pull any new updates
* Installs the npm dependency 
* Starts your npm server

You can customize the startup commend by editing `ENTRYPOINT`

# Additional Docker stuffs to look at
## [Port publishing](http://docs.docker.com/engine/reference/run/):
Check which port your app is running, then on docker run command add -p HOST_PORT:CONTAINER_PORT
`docker run -p 5000:5000 docker-nodejs git clone https://github.com/zmsp/node-js-sample.git && cd */ && npm install`
## [Shared volumes](http://docs.docker.com/engine/userguide/dockervolumes/)
## Exec into docker container [EXEC](http://docs.docker.com/engine/reference/commandline/exec/)
...

Feel free to improve or send me pull request
-- Zobair
