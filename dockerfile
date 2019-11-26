FROM ubuntu:18.04

# Installing wget and add-apt-repository
RUN apt-get update
RUN apt-get install -y software-properties-common wget

# Adding openfoam repository
RUN sh -c "wget -O - http://dl.openfoam.org/gpg.key | apt-key add -"
RUN add-apt-repository http://dl.openfoam.org/ubuntu

# Installing OpenFOAM (without paraview)
RUN apt-get update
RUN apt-get install -y --no-install-recommends openfoam7

# Cleaning the environment
RUN apt-get clean autoclean
RUN apt-get autoremove -y

# Creating foamer user
RUN useradd -m -d /home/foamer -s /bin/bash foamer
USER foamer
ENV HOME /home/foamer

# Creating the FOAM_RUN folder
RUN mkdir -p /home/foamer/OpenFOAM/foamer-7/run
WORKDIR /home/foamer/OpenFOAM/foamer-7/run

# Setting environment variables
RUN echo 'source /opt/openfoam7/etc/bashrc' >> /home/foamer/.bashrc

# Copying tutorials directory into FOAM_RUN
RUN cp -r /opt/openfoam7/tutorials /home/foamer/OpenFOAM/foamer-7/run/tutorials
