FROM instrumentisto/rsync-ssh

RUN apk update \
     && apk upgrade \
     && apk add --no-cache \
        curl \
    && curl -fL -o /tmp/docker.tar.gz \
    https://download.docker.com/linux/static/edge/x86_64/docker-18.03.0-ce.tgz \
    && tar -xvf /tmp/docker.tar.gz -C /tmp/ \
    \
    && chmod +x /tmp/docker/docker \
    && mv /tmp/docker/docker /usr/local/bin/ \
    \
    && mkdir -p /usr/local/share/doc/docker/ \
    && curl -fL -o /usr/local/share/doc/docker/LICENSE \
    https://raw.githubusercontent.com/docker/docker-ce/v18.03.0-ce/components/cli/LICENSE \
    \
    && rm -rf /tmp/*