FROM docker.io/library/archlinux:latest

ENV REFRESHED_AT 2024-03-19

EXPOSE 1080

RUN pacman -Sy microsocks --noconfirm ; pacman -Scc --noconfirm

USER nobody:nobody
WORKDIR /tmp
CMD ["/usr/bin/microsocks"]
