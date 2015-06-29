# install Docker
wget -qO- https://get.docker.com/ | sh
# upgrade Docker by using wget's -N flag
wget -N https://get.docker.com/ | sh

# install docker compose
curl -L https://github.com/docker/compose/releases/download/1.3.1/docker-compose-$(uname -s)-$(uname -m) > ~/bin/docker-compose
chmod u+x ~/bin/docker-compose


docker ps       # list running containers
docker ps -a    # shows all containers

docker images   # list local images
# REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
# ubuntu              14.04               c4ff7513909d        2 days ago          225.4 MB
# ubuntu              latest              c4ff7513909d        2 days ago          225.4 MB
# ubuntu              14.04.1             c4ff7513909d        2 days ago          225.4 MB
# ubuntu              trusty              c4ff7513909d        2 days ago          225.4 MB
# REPOSITORY. The name of the repository, which in this case is "ubuntu".
# TAG. We'll talk more about tags in a bit, but tags are similar to those found in git or other version control systems, and represent a specific set point in the repositories' commit history. As you can see from the list, we've pulled down a bunch of different versions of ubuntu: 14.04, 14.10, 12.04, etc. Each of these versions is tagged with a version number, a name, and there's even a special tag called "latest" which represents the latest version.
# IMAGE ID. This is like the primary key for the image. Sometimes, such as when you commit a container without specifying a name or tag, the repository or the tag is <NONE>, but you can always refer to a specific image or container using its ID.
# CREATED. The date the repository was created, as opposed to when it was pulled. This can help you assess how "fresh" a particular build is. Docker appears to update their master images on a fairly frequent basis.
# VIRTUAL SIZE. The size of the image.

docker history ubuntu:latest
# IMAGE               CREATED             CREATED BY                                      SIZE
# c4ff7513909d        7 days ago          /bin/sh -c #(nop) CMD [/bin/bash]               0 B
# cc58e55aa5a5        7 days ago          /bin/sh -c apt-get update && apt-get dist-upg   32.67 MB
# 0ea0d582fd90        7 days ago          /bin/sh -c sed -i 's/^#\s*\(deb.*universe\)$/   1.895 kB
# d92c3c92fa73        7 days ago          /bin/sh -c rm -rf /var/lib/apt/lists/*          0 B
# 9942dd43ff21        7 days ago          /bin/sh -c echo '#!/bin/sh' > /usr/sbin/polic   194.5 kB
# 1c9383292a8f        7 days ago          /bin/sh -c #(nop) ADD file:c1472c26527df28498   192.5 MB
# 511136ea3c5a        14 months ago                                                       0 B


docker stop <container id>
docker kill <conatiner name>

docker logs <container id>

# run a command on a running container
docker exec <container id> ls /etc

# container: running instance of an image
# docker run [OPTIONS] IMAGE [COMMAND] [ARG...]

docker run \    # run a container
    -t \        # allocate a (pseudo) tty
    -i \        # keep stdin open (so we can interact with it)
    ubuntu \    # use the Ubuntu base image
    /bin/bash   # run the Bash shell

# A Docker container only stays alive as long as there is an active process being run in it.


docker diff <container id>
# A /.bash_history
# C /dev
# A /dev/kmsg

# Docker tracks any changes we make to a container

docker commit <container id> <name>:<tag>
# commit changes, name the image and tag it in one go


# The Dockerfile provides a set of instructions for Docker to run on a container.
docker build -t <image> .
# build a new image from a Dockerfile (present in current working dir)


# run the web server
docker run -p 80:80 -d nginx-example
# -p 80:80 - binds the container's port 80 to the guest machine's, so if we curl localhost or go to the server's IP address in our browser, we'll see the results of Nginx processing requests on port 80 in the container


# share a directory in between the Container and our host machine
docker run \
    -v /host/dir:/container/dir:rw \    # The volumes to share. Note rw is read-write. We can also define ro for "read-only"
    -p 80:80 \                          # exposes port 80 on the container and routes it to port 80 on the host
    -w /home \                          # sets the working directory used when the container starts. Note that this must be an absolute path
    -d \                                # run container as daemon
    nginx-example                       # Run our image nginx-example, which has the "CMD" setup to run nginx


docker inspect <container id>

docker inspect -f="{{ .NetworkSettings.IPAddress }}" <container id>
# 172.17.0.3


# linking containers

# Start a container and name it something useful (in this case, mysql, via the -name parameter)
docker run \
    -p 3306:3306 \      # Binds the local port 3306 to the container's port 3306, so a local
    -d \                # run container as daemon
    -name mysql \       # container name
    some-mysql-image    # image name (has to be last)

# Start your web application container and link it to that container via -d name:db (where db is an arbitrary name used in the container's environment variables)
docker run -p 80:80 -link mysql:db -d some-application-image
# In this example, the some-application-image will have environment variables available such as DB_PORT_3306_TCP_ADDR=172.17.0.8 and DB_PORT_3306_TCP_PORT=3306 which you application can use to know the database location.

# run in the background with -d
docker run -d --name=my_redis redis


# cleaning up
docker rm <container id>        # delete a container
docker rm $(docker ps -a -q)    # delete all stopped containers
docker rmi <image id>           # delete images
docker rmi $(docker ps -a -q)   # delete all images
# You must remove all containers using an image before deleting the image

# Delete all un-tagged (or intermediate) images:
docker rmi $(docker images | grep '<none>' | tr -s ' ' | cut -d ' ' -f 3)


# Registry
docker tag toto/apache registry.acme.org/toto/apache
docker push registry.acme.org/toto/apache


docker run \
    --rm \      # container will be deleted right after it runs
    -v "$(pwd)":/app \
    -w /app google/ruby sh -c 'ruby hello.rb'


# what environment variables does an image have?
docker run ubuntu env
# HOME=/
# PATH=...
# HOSTNAME=zfzfzfzfzef


# RUN vs. CMD instruction
docker build    # will execute RUN instructions
docker run      # runs CMD instructions by default


# CMD vs. ENTRYPOINT instruction
# CMD ["echo"]
docker run image echo hello
# hello
# overrideable

# ENTRYPOINT ["echo"]
docker run image echo hello
# echo hello
# not overrideable


# generate an image dependency diagram
docker images -viz | dot -Tpng -o docker.png
# to see it, run this on the host
python -m SimpleHTTPServer
# then browse to http://machinename:8000/docker.png
