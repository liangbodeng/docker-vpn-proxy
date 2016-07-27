FROM ubuntu:14.04
MAINTAINER Leo Deng <liangbo.deng@gmail.com>

RUN apt-get update && \
  apt-get update -y && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server openvpn && \
  rm -rf /var/lib/apt && \
  mkdir /var/run/sshd && \
  (echo 'root:p' | chpasswd) && \
  sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
  sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd && \
  (echo "export VISIBLE=now" >> /etc/profile)

ENV NOTVISIBLE "in users profile"

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
