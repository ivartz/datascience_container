#!/bin/bash

docker run --user root -e NB_UID=1001 -e NB_GID=1001 -e GRANT_SUDO=yes -v /home/loek/.jupyter:/etc/ssl/notebook -v /media/loek/HD/Cyborg:/home/jovyan/work -p 9999:8888 jupyter/all-spark-notebook start-notebook.sh --NotebookApp.keyfile=/etc/ssl/notebook/mycert.pem --NotebookApp.certfile=/etc/ssl/notebook/mycert.pem --NotebookApp.password='sha1:832eed7478e2:4f26774c296b0cb8fa950c11edc8a42e43ead533'
