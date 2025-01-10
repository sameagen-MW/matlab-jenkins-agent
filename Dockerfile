FROM jenkins/ssh-agent:debian-jdk17

RUN apt-get update \
    && apt-get install --no-install-recommends -y wget

RUN wget -O /tmp/base-dependencies.txt \
    https://raw.githubusercontent.com/mathworks-ref-arch/container-images/refs/heads/main/matlab-deps/r2024b/ubuntu22.04/base-dependencies.txt

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install --no-install-recommends -y `cat /tmp/base-dependencies.txt` \
    && apt-get clean && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*
