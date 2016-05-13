# This Dockerfile was built following the example Dockerizing MongoDB,
# located at https://docs.docker.com/engine/examples/mongodb/
# Based on ubuntu:latest, installs MongoDB following the instructions from:
# http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/

FROM ubuntu:latest
MAINTAINER Michael Corum <tnridgeback@gmail.com>

# Installation:
# 1. Import MongoDB public GPG key 
# 2. Create a MongoDB list file
# 3. Update apt-get sources and install MongoDB
# 4. Create the MongoDB data directory
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 \
		&& echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list \
		&& apt-get update && apt-get install -y mongodb-org \
		&& mkdir -p /data/db
		
# Expose port 27017 from the container to the host
EXPOSE 27017

# Set usr/bin/mongod as the dockerized entry-point application
ENTRYPOINT ["/usr/bin/mongod"]