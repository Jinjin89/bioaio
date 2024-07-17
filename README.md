# 


##

1. build the image

2. create the container


3. remove the image


4. 

```bash
# remove 
docker container rm $(docker ps -aq)
docker image rm r-test:4.4.1

# build image
docker build -t r-test:4.4.1 .

# build container
docker run --name r4 \
    -p 18787:8787\
    -e PASSWORD='pass'\
    r-test:4.4.1

# get interactive
docker run -it r-test:4.4.1 bash

# get bash 
docker exec it r-test:4.4.1 bash

# cp data to container
docker cp resources r4:/home/rstudio/resources

```