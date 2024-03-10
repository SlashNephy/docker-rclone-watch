FROM rclone/rclone@sha256:a693c46a6b8b7585f77ffb439b5727cb192f0b865f3da66efbc049e6ef1c5c4c

# Install inotifywait
RUN apk add --no-cache inotify-tools

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

LABEL org.opencontainers.image.source https://github.com/SlashNephy/docker-rclone-watch
WORKDIR /
ENTRYPOINT [ "/entrypoint.sh" ]
