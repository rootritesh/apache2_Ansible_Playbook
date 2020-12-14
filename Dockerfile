FROM ubuntu:latest
RUN apt update && apt install  openssh-server sudo -y
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test
RUN  echo "test:test"| chpasswd
RUN service ssh start
RUN echo "test ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]