FROM alpine
RUN apk add --no-cache git
RUN apk add --no-cache curl
RUN apk add --no-cache openssh

ADD ./id_ed25519 /root/.ssh/id_ed25519
ADD . /src
ADD ./config /root/.ssh/config

RUN chmod 600 /root/.ssh/id_ed25519

RUN git config --global user.email "maurice.muschalik@gmail.com"
RUN git config --global user.name "Maurice M."

CMD ["git","--version"]