FROM ruby:3.2.9

ARG WS
ARG USER_NAME
ARG PASSWORD
ARG ENTRY_DIR
ARG ENTRY_POINT
ARG VOLUME
ARG LANG

EXPOSE 3000

ENV USER_ID=1001
ENV GROUP_ID=1001

# RUN 命令はなるべく1つにまとめる
# コマンドが長くなる場合は \ で改行すること
RUN apt update && \
    apt upgrade -y && \
    apt install -y \
    sudo nano iproute2 iputils-ping locales && \
    useradd -m -s /bin/bash -u ${USER_ID} ${USER_NAME} && \
    usermod -aG sudo ${USER_NAME} && \
    echo "root:${PASSWORD}" | chpasswd && \
    echo "${USER_NAME}:${PASSWORD}" | chpasswd && \
    mkdir -p /home/${USER_NAME}/${ENTRY_DIR} && \
    echo "${LANG} UTF-8" > /etc/locale.gen && \ 
    locale-gen
RUN update-locale LANG=${LANG}

COPY ${ENTRY_POINT} /home/${USER_NAME}/${ENTRY_DIR}/${ENTRY_POINT}
RUN chmod +x /home/${USER_NAME}/${ENTRY_DIR}/${ENTRY_POINT}

WORKDIR /home/${USER_NAME}/${WS}/ruby/

COPY ${VOLUME}/ruby/Gemfile /home/${USER_NAME}/${WS}/ruby/Gemfile
COPY ${VOLUME}/ruby/Gemfile.lock /home/${USER_NAME}/${WS}/ruby/Gemfile.lock

RUN apt install -y \
    nodejs sqlite3 build-essential libssl-dev libreadline-dev zlib1g-dev \
    && \
    bundle install