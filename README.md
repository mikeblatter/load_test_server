# LoadTestServer

LoadTestServer is a Rails app that allows you to create, run, and store results for load tests. Fully dockerized.
## Initial Login

This gets added when running rake db:setup_initial.  Will only add if there are no users in the database,
so this can be run at any time afterwards too.

Username: admin@admin.com

Password: test1234

## Features

1. Fully dockerized, no annoying ruby env setups, only Docker
2. Linear loading of users up and down, with the ability to create complicated scenarios.
3. Create custom user scenarios by GET/POST against web endpoints with the ability to do params too
4. Store AWS EC2/RDS instances CloudWatch metric data while load testing is occurring
5. View test results and metrics data

## Basic Installation

1. Install Docker https://www.docker.com
2. Run `./helpers/build.sh` then `./helpers/run.sh` to run locally
3. Go to http://localhost:88
   - Using 88 port locally so its not interfering with other services

## Docker Important Commands

* docker-machine ps
  * Lists machines that are currently running/stopped/etc...
* docker-machine env NAME_OF_MACHINE
  * Replace NAME_OF_MACHINE with the name given in docker-machine ls
* eval "$(docker-machine env NAME_OF_MACHINE)"
  * Adds environment variables to shell session so you are using the correct virtual machine
* docker-compose up
  * Builds/updates/runs docker container using the docker-compose.yml.
* docker-machine stop NAME_OF_DOCKER_MACHINE
  * Stops machine
* docker-machine rm NAME_OF_DOCKER_MACHINE
  * Removes machine
  
# Contributors

1. [Mike Blatter](https://github.com/mikeblatter)
2. [Erik Stockmeier](https://github.com/erikdstock)