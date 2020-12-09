FROM archlinux/base
MAINTAINER Keshav DAWOO <keshavdawoo87@gmail.com>
ENV container docker
RUN pacman -Syu --noconfirm;pacman -S vim net-tools iputils --noconfirm;
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in ; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done);
RUN rm -rf /lib/systemd/system/multi-user.target.wants/ \
 && rm -rf /etc/systemd/system/.wants/ \
 && rm -rf /lib/systemd/system/local-fs.target.wants/ \
 && rm -rf /lib/systemd/system/sockets.target.wants/udev \
 && rm -rf /lib/systemd/system/sockets.target.wants/initctl \
 && rm -rf /lib/systemd/system/basic.target.wants/ \
 && rm -rf /lib/systemd/system/anaconda.target.wants/*;
VOLUME ["/sys/fs/cgroup"]
ENTRYPOINT ["/usr/lib/systemd/systemd"]
CMD ["/usr/sbin/init"]
