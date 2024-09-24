FROM rclone/rclone@sha256:e78b765d51301e1934c376e9b5d0b42a156352099502a812b5e3b3bd37ccb33b

# Install inotifywait
RUN apk add --no-cache inotify-tools

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

LABEL org.opencontainers.image.source https://github.com/SlashNephy/docker-rclone-watch
WORKDIR /
ENTRYPOINT [ "/entrypoint.sh" ]
