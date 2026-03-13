FROM openjdk:26-ea-21-bookworm

WORKDIR /server

# Copy server seed files into the image
COPY skyblock.zip /opt/bootstrap/
COPY server.properties /opt/bootstrap/
COPY server.jar /opt/bootstrap/
COPY entrypoint.sh /opt/entrypoint.sh
COPY server-icon.png /opt/

RUN apt update && apt install unzip && mkdir /server/skyblock

RUN chmod +x /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]
