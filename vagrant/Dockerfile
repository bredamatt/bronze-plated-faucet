FROM --platform=linux/x86_64 ubuntu:20.04

RUN apt-get update && \ 
    apt-get -y install \
    wget \
    build-essential \
    software-properties-common \
    lsb-release \
    libelf-dev \
    linux-headers-generic \
    pkg-config 
    
RUN wget https://apt.llvm.org/llvm.sh &&  \
    chmod +x llvm.sh && \
    ./llvm.sh 13 && \ 
    rm -f ./llvm.sh

RUN useradd --create-home -s /bin/bash vagrant && \
    echo -n 'vagrant:vagrant' | chpasswd && \ 
    echo 'vagrant ALL = NOPASSWD: ALL' > /etc/sudoers.d/vagrant && \
    chmod 440 /etc/sudoers.d/vagrant && \
    mkdir -p /home/vagrant/.ssh && \
    chmod 700 /home/vagrant/.ssh && \
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC2pENNUWGe9xTsv9rNP6/MPs+v6z7JQUFPnZexk53u1nOQHnKToCwIsbLmfnbU35iDh8CzeCjbzhMTg5i4iBsCNb4GpGaUQXm19LtK/GT+mjvZHcW8jDVEjIZkOH0r45cM2FjTKRebA5Gev8+NlF1pUHSJfStI9xxIdtQfiXSPvR5Lc2W0vAw3n4IBkroj4mRy8obs3eCEFDKZWUtoE0hO4hCgIxB4dLLKhBylcu6eWJWBUCHlfYoFbSQI/WLo94mCM9GHQDmKLu1tdSdJIhr3JJXGnvm5W/Bc/WUSLZmMbmk/NJUQGkb72b8BYPg36rTqiFISmtXvjJkCwX2V4jvagEKVop68cR58rpRP2ZdYNl5ECD2oKvsTO1M0YqNNg6+L62UTVicbNQMYMHZ2Tq7UMQqi/AJIydD62YVTQnaMI7l3Su9NgCURWuYETNueIyoMFr2jXp5ZWZYpZAoMZTCfMaX1XpjSwOyflLQsHPwnkeqz4c+T6LfhzXqN7ZNRzcH+RBc3GhSheKt/gAA8X0B9HMLf5Qu7hS8paAPADscpk3bNKeFoEAjQxN5XwV6VzR1oytYOwrwjkmDnUWpS8bB0vd+3JFzLyFW2BkOKRrFvhkA3W7DJ/rCMFVqVxXrhsVTZknfMULrGJfZiAh+1kEiv1mE81y5Sa96XoQap9I4T3Q==" > /home/vagrant/.ssh/authorized_keys && \
    chmod 600 /home/vagrant/.ssh/authorized_keys && \
    chown -R vagrant:vagrant /home/vagrant/.ssh && \
    sed -i -e 's/Defaults.*requiretty/#&/' /etc/sudoers && \
    sed -i -e 's/\(UsePAM \)yes/\1 no/' /etc/ssh/sshd_config

# Start SSH
RUN mkdir /var/run/sshd
EXPOSE 22
RUN /usr/sbin/sshd

CMD ["/usr/sbin/sshd", "-D"]
