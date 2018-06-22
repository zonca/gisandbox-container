Docker container for GISandbox
==============================

Automatically built container available at:

<https://hub.docker.com/r/zonca/gisandbox-container/>

## Build the container locally

* Checkout the repository
* modify the Dockerfile, if needed
* `cd` into the folder
* Build it with:

        docker built -t gisandbox-container .

## Download the container from DockerHub

    docker pull zonca:gisandbox-container
    docker run -p 8888:8888 zonca/gisandbox-container

Open the browser and connect to `localhost:8888`
and insert the token printed out in the console.
