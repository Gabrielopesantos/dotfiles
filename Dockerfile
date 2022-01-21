FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential sudo && \
    apt-get clean autoclean &&  \
    apt-get autoremove -y

FROM base AS gab
ARG TAGS
RUN addgroup --gid 1000 gabriel
RUN adduser --gecos gabriel --uid 1000 --gid 1000 --disabled-password gabriel
RUN usermod -a -G sudo gabriel
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER gabriel
WORKDIR /home/gabriel

FROM gab
COPY . .
# Test locally
COPY --chown=gabriel:gabriel . .dotfiles
# CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
CMD ["bash"]