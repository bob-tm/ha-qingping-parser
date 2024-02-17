ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk update --no-cache && \
    apk add --no-cache \
		npm

RUN apk --no-cache add ca-certificates wget

# Install glibc to run Bun
RUN if [[ $(uname -m) == "aarch64" ]] ; \
    then \
    # aarch64
    wget https://raw.githubusercontent.com/squishyu/alpine-pkg-glibc-aarch64-bin/master/glibc-2.26-r1.apk ; \
    apk add --no-cache --allow-untrusted --force-overwrite glibc-2.26-r1.apk ; \
    rm glibc-2.26-r1.apk ; \
    else \
    # x86_64
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk ; \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub ; \
    apk add --no-cache --force-overwrite glibc-2.28-r0.apk ; \
    rm glibc-2.28-r0.apk ; \
    fi
# Install Bun
RUN npm install -g bun

WORKDIR /usr/src/app
COPY start.sh package*.json bun.lockb ./

RUN bun install
COPY . .

ENV NODE_ENV production

RUN chmod +x start.sh

ENTRYPOINT ["/usr/src/app/start.sh"]