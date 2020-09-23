FROM tsl0922/musl-cross
RUN git clone --depth=1 https://github.com/tsl0922/ttyd.git /ttyd \
    && cd /ttyd && env BUILD_TARGET=x86_64 WITH_SSL=true ./scripts/cross-build.sh

FROM ubuntu:20.04
COPY --from=0 /ttyd/build/ttyd /usr/bin/ttyd

COPY home/ttyd /home/ttyd
RUN apt update && apt -y install \
    sudo vim openssh-client openssl tmux tmuxinator && \
    apt remove -y tmuxinator && \
    gem install tmuxinator && \
    mkdir -p /home/ttyd && \
    useradd -d /home/ttyd -s /bin/bash ttyd && \
    echo "export EDITOR=vi" > /home/ttyd/.bashrc && \
    chown -R ttyd:ttyd /home/ttyd

EXPOSE 7681

ENTRYPOINT ["sudo", "-i", "-u", "ttyd", "/home/ttyd/run.sh"]
