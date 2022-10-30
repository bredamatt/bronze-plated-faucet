FROM --platform=linux/x86_64 ubuntu:latest

RUN useradd --create-home --shell /bin/bash vagrant
RUN echo vagrant:vagrant | chpasswd
RUN echo root:vagrant | chpasswd

ADD https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub \
    /home/vagrant/.ssh/authorized_keys
RUN chown -R vagrant:vagrant /home/vagrant/.ssh
RUN chmod 0600 /home/vagrant/.ssh/authorized_keys
RUN chmod 0700 /home/vagrant/.ssh

RUN apt-get update \
    && apt-get install -y openssh-server sudo wget curl puppet build-essential \
    software-properties-common \ 
    lsb-release \
    libelf-dev \ 
    linux-headers-generic \ 
    pkg-config \
    && wget https://apt.llvm.org/llvm.sh && chmod +x llvm.sh && ./llvm.sh 13 && rm -f ./llvm.sh \ 
    && apt-get clean 

RUN llvm-config-13 --version | grep 13

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y \
    && source $HOME/.cargo/env

RUN cargo install cargo-bpf

RUN cargo bpf --version

ADD sudoers.d/01_vagrant /etc/sudoers.d/

RUN chmod 0400 /etc/sudoers.d/01_vagrant

RUN mkdir /var/run/sshd
CMD ["/usr/sbin/sshd", "-D", "-e"]
EXPOSE 22
