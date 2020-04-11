## Building a container image

```
docker build --t|--tag <image_name> .
```

This command builds the image **<image_name>** based on the contents of the current directory (the dot at the
end of the build command).
Docker will look for the Dockerfile in the directory and build the image based on the instructions in the
file. 

## Listing locally stored images
```
docker images
```

## Running the container image
```
docker run --name <container_name> -p <host_port>:<cotainer_port> -d <image_name>
```

#### Ej:
```
docker run --name kubia-container -p 8080:8080 -d kubia
```

This tells to Docker to run a new container called **kubia-container** from the **kubia** image. The container will
be detached from the console (**-d** flag), which means it will run in the background. Port 8080 on the local
machine will be mapped to port 8080 inside the container (**-p 8080:8080**), so the app can be access through
http://localhost:8080

## Listing running containers
```
docker ps
```

## Getting additional information about a container
```
docker inspect <container_name>
```
## Running a shell inside an existing container
```
docker exec -it <container_name> bin/bash
```
**-i** makes sure STDIIN is kept open. It's needed for entering commands into the shell.
**-t** allocates a pseudo terminal (TTY).

## Stopping and removing a container
```
docker stop <container_name>
```
This command will stop the **<container_name>** container.
To truly remove a container, the command used is  **rm**:
```
docker rm <container_name>
```

## Pushing the image to an image registry
Before do it, we need to re-tag the image. If we go to push the image to Docker Hub, we need to follow
the Docker Hub's rules.
These rules for Docker Hub says that the image's repository name must with your Docker Hub ID.

##### Tagging an image under an additional tag
```
docker tag <image_name> <dockerhub_ID>/<docker_image>
```

###### Ej:
```
docker tag kubia ernestoacostacuba/kubia
``` 
##### Pysing the image to Docker Hub
```
docker push <dockerhub_ID>/<docker_image>
```

###### Ej:
```
docker push ernestoacostacuba/kubia
``` 