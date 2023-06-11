# Project Directory Structure

This is the directory structure for our project.



.
├── .gitignore <br>
├── data <br>
├── docker-files <br>
│   ├── node-chrome-stable <br>
│   │   ├── Dockerfile <br>
│   ├── node-chromium <br>
│   │   ├── Dockerfile <br>
├── readme.md <br>
├── services <br>
│   ├── service1.yml <br>
│   ├── service2.yml <br>
│   ├── service3.yml <br>
├── stack-backend <br>
│   ├── docker-compose.yml <br>
├── stack-dashboard <br>
│   ├── dashy-config.yml <br>
│   ├── docker-compose.yml <br>
├── stack-manage-containers <br>
│   ├── docker-compose.yml <br>
├── stack-manage-network <br>
│   ├── docker-compose.yml <br>
│   ├── unbond.conf <br>


## Description

- .gitignore - file that specifies files and directories that Git should ignore when tracking changes in our source code.
- data/ - folder that contains data files.
- docker-files/ - folder that contains Dockerfiles for building Docker images.
- readme.md - this file you are currently reading.
- services/ - folder that contains Docker Compose files for running various services.
- stack-backend/ - folder that contains a Docker Compose file for setting up the backend stack.
- stack-dashboard/ - folder that contains a Docker Compose file and configuration for setting up a dashboard using Dashy.
- stack-manage-containers/ - folder that contains a Docker Compose file for managing containers.
- stack-manage-network/ - folder that contains a Docker Compose file for managing the network.

## Usage

This directory structure is intended to be used as part of a larger project. You can use it as a starting point for your own project, or integrate it into an existing project as needed.

If you are new to Docker, we recommend reviewing the documentation on the [Docker website](https://www.docker.com/get-started) to learn more about how it works and how to use it effectively.

Once you have Docker set up on your system, you can use the Dockerfiles in the docker-files folder to build Docker images, and the Docker Compose files in the services and other folders to run various services and manage containers.

## Contributing

If you would like to contribute to this project, please review our [contributing guidelines](CONTRIBUTING.md) for information on how to get started.
