FROM ubuntu:latest

LABEL version="0.0"
LABEL description="pyenv+minicondaのpython環境"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y  && \
    apt-get install -y git
RUN apt-get install -y \
    make \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libffi-dev \
    liblzma-dev \
    nvidia-driver-470 \
    swig

ENV HOME /root
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/bin:$PATH

# pyenv
RUN git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv && \
    echo 'PYENV_ROOT="$HOME/.pyenv"' && \
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc && \
    . ~/.bashrc

# miniconda
COPY env.yaml /tmp/
RUN pyenv install miniconda3-latest
RUN pyenv global miniconda3-latest
ENV PATH $PYENV_ROOT/versions/miniconda3-latest/bin:$PATH 
RUN conda env create -f /tmp/env.yaml
RUN pyenv global miniconda3-latest/envs/team
# ENV PATH $PYENV_ROOT/versions/miniconda3-latest/envs/team/bin:$PATH 
ENV PATH $PYENV_ROOT/shims:$PATH 