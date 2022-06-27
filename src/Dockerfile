FROM python:3.9

RUN apt-get update
RUN pip install --no-cache pandas

ADD ./id_ed25519 /root/.ssh/id_ed25519
ADD . /src
ADD ./config /root/.ssh/config

RUN chmod 600 /root/.ssh/id_ed25519
RUN chmod 400 /root/.ssh/config

RUN git config --global user.email "maurice.muschalik@gmail.com"
RUN git config --global user.name "Maurice M."

CMD /src/download.sh