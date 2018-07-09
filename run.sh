#!/usr/bin/env sh

EXT=$1
ARGS=${2:--c:v libx265 -crf 25 -c:a aac -b:a 160k}

for FI in /home/data/*.$EXT; do
    FO="$(dirname "$FI")/$(basename "$FI" ".$EXT")_.mp4"

    ffmpeg -progress /dev/stdout -i "$FI" $ARGS "$FO"

    if [ $? -eq 0 ]; then
        FILESIZE=$(ls -lh "$FI" | awk '{print $5}')
        FILESIZE_AFTER=$(ls -lh "$FO" | awk '{print $5}')
        rm "$FI"
        echo "Done with \`$FI\`: $FILESIZE -> $FILESIZE_AFTER"
    else
        echo "Error with \`$FI\`: $?"
    fi
done
