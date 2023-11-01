#!/usr/bin/env python3

import anyio
import logging
import sys
import time

from tiny_proxy import Socks5ProxyHandler


logger = logging.getLogger(__name__)

def configure_logging():
    root_logger = logging.getLogger()
    root_logger.setLevel('INFO')

    fmt = '%(asctime)s [%(name)s:%(lineno)d] %(levelname)s : %(message)s'
    formatter = logging.Formatter(fmt)
    formatter.converter = time.gmtime

    stdout_handler = logging.StreamHandler(sys.stdout)
    stdout_handler.setFormatter(formatter)
    root_logger.addHandler(stdout_handler)

async def main():
    handler = Socks5ProxyHandler()
    listener = await anyio.create_tcp_listener(local_port=1080)
    await listener.serve(handler.handle)


if __name__ == '__main__':
    configure_logging()
    anyio.run(main)
