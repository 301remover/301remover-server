#!/bin/bash
MiB=1048576
WEBSOCKET=wss://tracker.archiveteam.org:1338/api/live_stats
INFO_URL=https://tracker.archiveteam.org:1338/api/project_settings?name=

OUTPUT=urlteam.json
echo [ > $OUTPUT
websocat $WEBSOCKET -B $MiB -1 -E |\
    jq -r '{project}[]|keys[]' |\
    while read shortner
    do
        while true
        do
            # bdu-me returns a 500 error; skip it
            if [ "$shortner" = "bdu-me" ]; then
                break
            fi
            curl -s $INFO_URL$shortner |\
                jq '. | {name: .name, shortcode_alphabet: .alphabet, url_pattern: .url_template}' >> $OUTPUT &&
                break
        done
    done
echo ] >> $OUTPUT
cat $OUTPUT | sed -e 's/^}/},/' | tac | sed '2 s/.*/}/' | tac > tmp
mv tmp $OUTPUT

mix ecto.setup
