#!/bin/bash
set -e

cd /server

echo "eula=true" > eula.txt

echo "Current Bootstrap Files"
ls /opt/bootstrap/

echo "Working Directory"
pwd

echo "RESET_WORLD=${RESET_WORLD}"

# Reset logic
if [ "${RESET_WORLD}" = "true" ]; then
    echo "RESET_WORLD enabled — wiping server directory"
    rm -rf /server/skyblock/
else
    echo "RESET_WORLD Disabled World Persists"
fi


if [ ! -d "/server/skyblock" ] || [ "$RESET_WORLD" = "true" ]; then
    echo "Initializing Skyblock server data..."
    echo "Copying Files"
    cp /opt/bootstrap/skyblock.zip /server/
    cp /opt/bootstrap/server.properties /server/
    cp /opt/bootstrap/server.jar /server/
    cp /opt/server-icon.png /server/
    echo "Extracting Skyblock world"
    unzip -o skyblock.zip -d /server/skyblock
    rm skyblock.zip

    echo "Moving icon"
    mv /server/skyblock/icon.png /server/ || true
else
    echo "Existing world detected — skipping bootstrap"
fi

echo "Current Listing"
ls

echo "Starting Minecraft server..."
echo "Memory Limit: ${MAX_MEMORY}"

exec java -Xms64M -Xmx${MAX_MEMORY:-1G} -jar server.jar nogui
