# docker-rclone-watch
🐳 A Docker image to monitor the filesystem and perform rclone copy.

## docker-compose

```yml
version: '3.8'

services:
  rclone-watch:
    container_name: rclone-watch
    image: ghcr.io/slashnephy/rclone-watch
    restart: always
    volumes:
      - /mnt:/mnt:ro
      - type: bind
        source: ./config
        target: /config/rclone
        read_only: true
    environment:
      RCLONE_COMMAND: copy /mnt/data1 user:data1 --drive-stop-on-upload-limit --transfers=20 -P
      INOTIFYWAIT_DIR: /mnt/data1
      INOTIFYWAIT_EVENTS: create,move
```
