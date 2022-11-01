FROM ubuntu:latest 

WORKDIR /root

RUN apt-get update && apt-get install -y linux-tools-common linux-tools-generic gcc wget vim
RUN ln -fs /usr/lib/linux-tools/*/perf /usr/bin/perf

RUN wget https://sh.rustup.rs -O rustup.sh \
    && sh rustup.sh --default-toolchain none -y \
    && rm rustup.sh \
    && /root/.cargo/bin/rustup default nightly \
    && mv /root/.cargo /root/cargo

ENV PATH=${PATH}:/root/cargo/bin

CMD ["/bin/bash", "-c"]
