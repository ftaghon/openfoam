FROM ubuntu:16.04

# dépendances
RUN apt-get update
RUN apt-get install -y build-essential flex bison git-core cmake zlib1g-dev libboost-system-dev libboost-thread-dev libopenmpi-dev openmpi-bin gnuplot libreadline-dev libncurses-dev libxt-dev vim


# Cleaning the environment
RUN apt-get clean autoclean
RUN apt-get autoremove -y


#RUN useradd -m -d /home/toto -s /bin/bash toto
#USER toto
#ENV HOME /home/toto

# OpenFOAM
#RUN mkdir -p $HOME/OpenFOAM/run/
#ADD OpenFOAM-6.tar.gz $HOME/OpenFOAM/
#ADD ThirdParty-6.tar.gz $HOME/OpenFOAM/

RUN mkdir -p /OpenFOAM/
#ADD OpenFOAM-6.tar.gz /OpenFOAM/
#ADD ThirdParty-6.tar.gz /OpenFOAM/

# Setting environment variables
#RUN echo 'source /OpenFOAM/OpenFOAM-6/etc/bashrc' >> $HOME/.bashrc
#RUN echo 'source /OpenFOAM/OpenFOAM-6/etc/bashrc' >> /etc/bash.bashrc

