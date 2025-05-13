FROM ghcr.io/actions/actions-runner:2.324.0

RUN sudo apt update -y && \
	sudo apt upgrade -y && \
	sudo apt install -y openjdk-21-jdk xz-utils dotnet-sdk-8.0 && \
	sudo apt clean && \
	sudo rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/* && \
	sudo curl -fsSL https://fvm.app/install.sh | sudo bash

# dotnet will be added to `/usr/bin/` which is already in the path
ENV PATH="$PATH:/root/.fvm_flutter/bin/:/home/runner/.dotnet/tools"
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64/
ENV NVS_HOME="/home/runner/.nvs"

# Doesn't work when building the docker image for some reason...
# RUN git clone https://github.com/jasongin/nvs "$NVS_HOME"
# RUN . "$NVS_HOME/nvs.sh" install