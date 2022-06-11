#!/bin/sh

JAVA_MX=3072M
JAVA_MS=3072M
/usr/bin/screen -AmdS "minecraft-$1" /usr/bin/java -Xmx${JAVA_MX} -Xms${JAVA_MS} -jar /var/lib/minecraft/$1/server.jar nogogui