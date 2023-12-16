FROM        --platform=$TARGETOS/$TARGETARCH debian:bookworm-slim

LABEL       author="Yamayaki" maintainer="yamayaki.de@icloud.com"

ENV         DEBIAN_FRONTEND noninteractive

## Update base packages
RUN         apt update \
            && apt upgrade -y

## Install dependencies
RUN         apt install -y libc++-dev libc6 wget curl tar zip unzip binutils liblzo2-2 iproute2 libatomic1 \
            libfontconfig libunwind8 libssl-dev sqlite3 libsqlite3-dev apt-transport-https software-properties-common ca-certificates \
            libz-dev tzdata libevent-dev libzip4 libstdc++6 libgcc-s1


##Install box64
RUN         wget https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list \
            && wget -qO- https://ryanfortner.github.io/box64-debs/KEY.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg  \
            && apt update && apt install box64-arm64 -y

RUN         useradd -d /home/container -m container
USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]