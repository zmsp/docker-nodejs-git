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
Change GITURL to match your repository. 
eg: GITURL=https://username@github.com/username/repo_name.git

Change the second github url to point to your nodejs project.
You may need to change line 14-15, 21-23 to match your project.

`ENTRYPOINT "cd /app/* && npm run dev"`
ll, npm install, npm run


## Shipping your project with Dockerfile/ Publishing your nodejs app with docker
### Customizing
Edit the Dockerfile located under `/dokcer-nodejs/Docker2`
Simply change the   `ENV GITURL` to match the github repo in the `Dockerfile` and ship it with your project
eg: ENV GITURL https://username@github.com/username/repo_name.git
### What does it do?
When you build the image:

* Clones the github project

Each time you start the container

* The docker image will pull any new updates
* Installs npm dependencies
* Starts your npm server

You can customize the startup commend by editing `ENTRYPOINT`

# Additional Docker stuffs to look at
## [Port publishing](http://docs.docker.com/engine/reference/run/):
Check which port your app is running, then on docker run command add -p HOST_PORT:CONTAINER_PORT
`docker run -p 5000:5000 docker-nodejs git clone https://github.com/zmsp/node-js-sample.git && cd */ && npm install`
## [Shared volumes](http://docs.docker.com/engine/userguide/dockervolumes/)
## Exec into docker container [EXEC](http://docs.docker.com/engine/reference/commandline/exec/)
...

