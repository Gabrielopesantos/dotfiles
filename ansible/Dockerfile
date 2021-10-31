FROM ubuntu:20.04
# ARG TAGS
WORKDIR /usr/local/bin
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y software-properties-common && apt-add-repository ppa:ansible/ansible && apt update && apt install -y curl git ansible build-essential
COPY . .
CMD ["sh", "-c", "ansible-playbook local.yml"]