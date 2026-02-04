FROM jupyter/base-notebook
LABEL "purpose"="local"

USER root

ENV PS1="[\u@\H \W]\\$ "
ENV HOME="/root"
WORKDIR ${HOME}

# 사내에서 실행할때 회사 인증서 등록이 필요
COPY .certs/WorxphereCA.pem /etc/pki/ca-trust/source/anchors/WorxphereCA.pem
RUN apt-get update && apt-get install -y ca-certificates && \
    update-ca-certificates


RUN apt-get update && apt-get install -y --no-install-recommends \
    tzdata \
    python3.11 python3-pip python3-dev \
    tar gzip unzip jq vim \
    libffi-dev libssl-dev \
    make cmake gcc g++ \
    libkrb5-dev libsasl2-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime && \
    echo 'Asia/Seoul' > /etc/timezone


COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --upgrade pip setuptools wheel && \
    pip3 install -r /tmp/requirements.txt


RUN groupadd --gid 1000 jupyter-user && \
    useradd  --uid 1001 --gid 1000 -m jupyter-user
ENV HOME="/home/jupyter-user"
WORKDIR ${HOME}

COPY src src
COPY sys sys
COPY content content
COPY .sh/bootstrap.sh .sh/bootstrap.sh
RUN chown -R jupyter-user:jupyter-user /home/jupyter-user && \
    chmod +x .sh/bootstrap.sh

ENV JUPYTER_CONFIG_DIR=${HOME}/.jupyter \
    JUPYTER_DATA_DIR=${HOME}/.local/share/jupyter \
    JUPYTER_RUNTIME_DIR=${HOME}/.local/share/jupyter/runtime

USER jupyter-user
RUN .sh/bootstrap.sh

EXPOSE 8888
