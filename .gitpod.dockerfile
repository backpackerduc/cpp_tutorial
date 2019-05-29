FROM gitpod/workspace-full:latest

USER root
# Install custom tools, runtime, etc.
# RUN apt upgrade
RUN apt-get update && apt-get install -y \
  silversearcher-ag \
  && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

RUN wget https://github.com/sharkdp/bat/releases/download/v0.11.0/bat_0.11.0_amd64.deb
RUN dpkg -i bat_0.11.0_amd64.deb

RUN pip3 install numpy
RUN pip3 install sympy
RUN pip3 install matplotlib

USER gitpod
# Apply user-specific settings

# Give back control
USER root