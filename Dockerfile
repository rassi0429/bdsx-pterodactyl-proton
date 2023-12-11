FROM ghcr.io/parkervcp/steamcmd:proton

USER root

# we wil need to tell bash to load .bashrc manually
ENV BASH_ENV ~/.bashrc
# needed by volta() function
ENV VOLTA_HOME /root/.volta
# make sure packages managed by volta will be in PATH
ENV PATH $VOLTA_HOME/bin:$PATH

RUN curl https://get.volta.sh | bash
RUN volta install node@20
RUN apt install git -y
RUN git clone https://github.com/bdsx/bdsx
RUN cd bdsx && ./update.sh

RUN sed -i '13s/^/#/' /home/container/bdsx/bdsx.sh
RUN sed -i '16iWINE="proton run"' /home/container/bdsx/bdsx.sh

USER container
ENV  USER=container HOME=/home/container
WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh

CMD [ "/bin/bash", "/entrypoint.sh" ]