# LoadTestServer

LoadTestServer is a Rails app that allows you to create, run, and store results for load tests.

We added Docker support for this, to help ease any differences in platforms.  This Rails app can operate
with or without Docker.  Just make sure to provide the correct environment variables when trying to run without.
  
## Initial Login

This gets added when running rake db:setup_initial.  Will only add if there are no users in the database,
so this can be run at any time afterwards too.

Username: admin@admin.com

Password: test1234

## Features

1. Linear loading of users up and down, with the ability to create complicated scenarios.
2. Create custom user scenarios by GET/POST against web endpoints with the ability to do params too
3. Store AWS EC2/RDS instances CloudWatch metric data while load testing is occurring
4. View test results and metrics data

## Basic Installation

1. Install Docker https://www.docker.com
2. Run build.sh then run.sh to run locally

## Docker Important Commands

* docker-machine ls
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