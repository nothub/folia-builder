FROM eclipse-temurin:17-alpine

RUN apk add --no-cache git

COPY ./build.sh /usr/local/bin/build-folia

ENV PUID=1000 PGID=1000

CMD [ "build-folia" ]
