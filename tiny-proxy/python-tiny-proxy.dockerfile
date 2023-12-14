FROM docker.io/library/archlinux:latest

ENV REFRESHED_AT 2023-11-01

EXPOSE 1080

RUN pacman -Sy python-tiny-proxy --noconfirm ; pacman -Scc --noconfirm

COPY --chmod=755 python-tiny-proxy.py /usr/bin/

USER nobody:nobody
WORKDIR /tmp
CMD ["/usr/bin/python-tiny-proxy.py"]
