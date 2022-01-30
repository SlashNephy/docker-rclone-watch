#!/bin/ash -e

if [ -z "$RCLONE_COMMAND" ]; then
    echo "ERROR: RCLONE_COMMAND is not set." 1>&2
    exit 1
fi

if [ -z "$RCLONE_DIR" ]; then
    echo "ERROR: RCLONE_DIR is not set." 1>&2
    exit 1
fi

# https://github.com/rclone/rclone/issues/249#issuecomment-425352531
while [[ true ]] ; do
    # performs synchronizations / copy
	`rclone $RCLONE_COMMAND`

	# waiting for something to change or it will pass 300 seconds
	inotifywait --recursive --timeout 300 -e modify,delete,create,move $RCLONE_DIR

	# going back to the beginning
done
