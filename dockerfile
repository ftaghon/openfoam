FROM ubuntu:16.04

# dépendances
RUN apt-get update
RUN apt-get install -y build-essential flex bison git-core cmake zlib1g-dev libboost-system-dev libboost-thread-dev libopenmpi-dev openmpi-bin gnuplot libreadline-dev libncurses-dev libxt-dev vim

# Cleaning the environment
RUN apt-get clean autoclean
RUN apt-get autoremove -y

# Creating foamer user
RUN useradd -m -d /home/foamer -s /bin/bash foamer
USER foamer
ENV HOME /home/foamer

# OpenFOAM downloading
RUN mkdir -p /home/foamer/OpenFOAM/
WORKDIR /home/foamer/OpenFOAM/
RUN git clone git://github.com/OpenFOAM/OpenFOAM-6.git
RUN git clone git://github.com/OpenFOAM/ThirdParty-6.git

# Setting environment variables
RUN echo 'source /home/foamer/OpenFOAM/OpenFOAM-6/etc/bashrc' >> /home/foamer/.bashrc

# OpenFOAM compiling
WORKDIR /home/foamer/OpenFOAM/OpenFOAM-6/
RUN /bin/bash -c "source /home/foamer/OpenFOAM/OpenFOAM-6/etc/bashrc; ./Allwmake -j"
