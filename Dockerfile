FROM ubuntu:latest

RUN apt update && apt install -y sudo 

RUN useradd -g video --create-home --shell /bin/bash rishabh && \
		echo "rishabh ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/rishabh && \
		chmod 0400 /etc/sudoers.d/rishabh

USER rishabh
WORKDIR /home/rishabh

RUN sudo apt update && sudo apt install -y apt-utils tmux vim lsb-release

RUN sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
		sudo apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116 && \
		sudo apt update && \
		sudo apt install -y ros-kinetic-desktop-full && \
		echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc

RUN sudo apt update && sudo apt install -y python-rosinstall python-rosinstall-generator python-wstool build-essential

RUN sudo sh -c sudo apt-get install -y ros-kinetic-move-base-* \
				       ros-kinetic-rosserial 
