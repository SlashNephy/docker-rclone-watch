#!/bin/ash -e

if [ -z "$RCLONE_COMMAND" ]; then
    echo "ERROR: RCLONE_COMMAND is not set." 1>&2
    exit 1
fi

if [ -z "$INOTIFYWAIT_DIR" ]; then
    echo "ERROR: INOTIFYWAIT_DIR is not set." 1>&2
    exit 1
fi

INOTIFYWAIT_OPTIONS=${INOTIFYWAIT_OPTIONS:-""}
INOTIFYWAIT_EVENTS=${INOTIFYWAIT_EVENTS:-"create,move,modify,delete"}

# https://github.com/rclone/rclone/issues/249#issuecomment-425352531
while [[ true ]] ; do
    # performs synchronizations / copy
    eval "rclone $RCLONE_COMMAND"

    # waiting for something to change or it will pass timeout
    eval "inotifywait $INOTIFYWAIT_OPTIONS -e $INOTIFYWAIT_EVENTS $INOTIFYWAIT_DIR"
done
