FROM --platform=linux/x86_64 ubuntu:latest

SHELL ["/bin/bash", "-c"]

RUN useradd --create-home --shell /bin/bash vagrant
RUN echo vagrant:vagrant | chpasswd
RUN echo root:vagrant | chpasswd

ADD https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub \
    /home/vagrant/.ssh/authorized_keys
RUN chown -R vagrant:vagrant /home/vagrant/.ssh
RUN chmod 0600 /home/vagrant/.ssh/authorized_keys
RUN chmod 0700 /home/vagrant/.ssh

WORKDIR /home/vagrant/

RUN apt-get update && apt-get install -y openssh-server linux-tools-common linux-tools-generic gcc wget vim
RUN ln -fs /usr/lib/linux-tools/*/perf /usr/bin/perf

ADD sudoers.d/01_vagrant /etc/sudoers.d/

RUN chmod 0400 /etc/sudoers.d/01_vagrant

RUN mkdir /var/run/sshd

USER vagrant

RUN wget https://sh.rustup.rs -O rustup.sh \
    && sh rustup.sh --default-toolchain none -y \
    && rm rustup.sh \
    && /home/vagrant/.cargo/bin/rustup default nightly \
    && mv /home/vagrant/.cargo /home/vagrant/cargo

RUN echo "export PATH=${PATH}:/home/vagrant/cargo/bin" >> /home/vagrant/.bashrc

USER root

CMD ["/usr/sbin/sshd", "-D", "-e"]
EXPOSE 22
