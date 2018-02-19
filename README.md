# datascience_container
Personalized Docker environment for Data Science tasks based on
https://github.com/jupyter/docker-stacks/tree/master/all-spark-noteboo

## Setup

1. Install Docker CE. Skip if you have
docker installed already. 

Since docker binds to a Unix socket, 
it needs to run as root.
The easiest is to run docker with sudo.

(start, Optional)
For running docker as non root,
your user needs to be added to the
docker group:
```bash
# Create a group called docker:
sudo groupadd docker

# add your user to the group docker
sudo usermod -aG docker $USER
# a log out and log in is necessary to re-evaluate user memberships.
# Since you don't want to do this, a workaround is 
(https://superuser.com/questions/272061/reload-a-linux-users-group-assignments-without-logging-out)
# Get the id of your current group, remember it
id -g
# switch to the docker group as primary for your user
newgrp docker
# switch back to the original group, using the group id 
# previously returned by id -g. In my case, it was
newgrp 1001
# Now you can finally run docker as non root without a re-login
```
(end, optional)

2. Clone the repository
```bash
git clone https://github.com/ivartz/datascience_container/
cd datascience_container
```

3. Build a docker image called datascience_container
based on the file Dockerfile
```bash
docker build -t datascience_container .
# run the container
docker run --user root -e NB_UID=1001 -e NB_GID=1001 -e GRANT_SUDO=yes -v /home/loek/.jupyter:/etc/ssl/notebook -v /media/loek/HD/Cyborg:/home/jovyan/work -p 9999:8888 jupyter/all-spark-notebook start-n
otebook.sh --NotebookApp.keyfile=/etc/ssl/notebook/mycert.pem --NotebookApp.certfile=/etc/ssl/notebook/mycert.pem --NotebookApp.password='sha1:832eed7478e2:4f26774c296b0cb8fa950c11edc8a42e43ead533'
