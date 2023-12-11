FROM ghcr.io/parkervcp/steamcmd:proton

USER root

# we wil need to tell bash to load .bashrc manually
ENV BASH_ENV ~/.bashrc
# needed by volta() function
ENV VOLTA_HOME /root/.volta
# make sure packages managed by volta will be in PATH
ENV PATH $VOLTA_HOME/bin:$PATH

WORKDIR /home/container

RUN curl https://get.volta.sh | bash && \
    volta install node@20 && \
    apt install git -y

USER container
COPY ./entrypoint.sh /entrypoint.sh

CMD [ "/bin/bash", "/entrypoint.sh" ]