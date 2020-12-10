FROM alpine:3.7

RUN apk update
RUN apk add bash htop bind-tools iputils curl wget

RUN curl -L -O https://releases.hashicorp.com/waypoint/0.1.5/waypoint_0.1.5_linux_arm.zip && \
    unzip waypoint_0.1.5_linux_arm.zip -d /usr/bin

VOLUME ["/data"]

RUN addgroup waypoint && \
    adduser -S -G waypoint waypoint && \
    chown -R waypoint:waypoint /data

USER waypoint

ENTRYPOINT ["/usr/bin/waypoint"]
