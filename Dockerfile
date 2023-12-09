FROM ubuntu:22.04

ENV VERSION=0.12.5

RUN apt update && apt upgrade -y && apt install curl openjdk-21-jre cron jq -yqq
RUN curl -LO https://github.com/AsamK/signal-cli/releases/download/v"${VERSION}"/signal-cli-"${VERSION}".tar.gz
RUN tar xf signal-cli-"${VERSION}".tar.gz -C /opt
RUN ln -sf /opt/signal-cli-"${VERSION}"/bin/signal-cli /usr/local/bin/
RUN ls -l /usr/local/bin/signal-cli

WORKDIR /app

COPY ./signal-bot /etc/cron.d/signal-bot
COPY ./script.sh ./

RUN chmod +x ./script.sh

RUN crontab /etc/cron.d/signal-bot

CMD ["cron", "-f"]