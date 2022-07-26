#!/bin/bash
# Lavalink Bootstrapper

cd "$(dirname "$0")" || exit

echo "Downloading lavalink jar..."
curl -s https://api.github.com/repos/freyacodes/Lavalink/releases/latest \
| grep "browser_download_url.*jar" \
| cut -d : -f 2,3 \
| tr -d \" \
| xargs -I % curl -sLO %
echo "Lavalink.jar is downloaded..."

echo "All set! Now, let's start Lavalink!"

exec java -Djdk.tls.client.protocols=TLSv1.1,TLSv1.2 -Xmx4G -jar Lavalink.jar
