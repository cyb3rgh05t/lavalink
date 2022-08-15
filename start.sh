#!/bin/bash
# Lavalink Bootstrapper

cd "$(dirname "$0")" || exit

echo "Downloading lavalink jar..."
curl "https://ci.fredboat.com/repository/download/Lavalink_Build/.lastSuccessful/Lavalink.jar?guest=1&branch=refs/heads/dev" -o Lavalink.jar
echo Lavalink.jar is downloaded...

echo "Downloading envsubst binary..."
curl -fsSL "https://github.com/a8m/envsubst/releases/download/v1.2.0/envsubst-$(uname -s)-$(uname -m)" -o envsubst
chmod +x envsubst
echo "Substituting environment variables..."
./envsubst < application.example.yml > application.yml
rm -f envsubst

echo "All set! Now, let's start Lavalink!"

exec java -Djdk.tls.client.protocols=TLSv1.1,TLSv1.2 -Xmx4G -jar Lavalink.jar
