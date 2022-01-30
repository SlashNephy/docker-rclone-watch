FROM rclone/rclone

# Install inotifywait
RUN apk add --no-cache inotify-tools

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

LABEL org.opencontainers.image.source https://github.com/SlashNephy/docker-rclone-watch
WORKDIR /
ENTRYPOINT [ "/entrypoint.sh" ]
