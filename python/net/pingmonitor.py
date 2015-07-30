#!/usr/bin/env python

"""Ping monitor"""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "22 Jun 2006"
__copyright__ = "Copyright 2006 Andrew Pennebaker"
__version__ = "0.1"

import ping
import getopt
import sys
import time


def monitor(
    hosts,
    timeout=2,
    length=56,
    ttl=128,
    interval=10,
    verbose=False
):
    """Monitor by ping"""

    hosts = [[host, None, None] for host in hosts]

    while True:
        for i in range(len(hosts)):
            updown, journey, packet = ping.ping(
                hosts[i][0], timeout, length, ttl
            )
            now = time.asctime()

            if hosts[i][1] != updown:
                hosts[i][1] = updown
                hosts[i][2] = now

                print("[%s]\n %s changed to %s" % (
                    hosts[i][2],
                    hosts[i][0],
                    ping.status[hosts[i][1]])
                )
            else:
                pass

            if verbose:
                print(" Data:\n%s" % (packet))

        time.sleep(interval)


def usage():
    """Print usage message"""

    print("Usage: %s [options] <host1 host2 host3 ...>" % (sys.argv[0]))
    print("\n-w wait for timeout <seconds>")
    print("-l length <even bytes>")
    print("-t <ttl>")
    print("-i <interval between pings>")
    print("-v verbose (dump packet)")
    print("-i interval <interval>")
    print("-h --help (usage)")

    sys.exit()


def main():
    """Run ping monitor"""

    system_args = sys.argv[1:]  # ignore program name

    hosts = []
    timeout = 2
    length = 56
    ttl = 128
    interval = 10
    verbose = False

    optlist = []
    args = []

    try:
        optlist, args = getopt.getopt(system_args, "w:l:t:vi:h", ["help"])
    except getopt.GetoptError:
        usage()

    if len(args) < 1:
        usage()

    for option, value in optlist:
        if option == "-h" or option == "--help":
            usage()

        elif option == "-w":
            timeout = int(value)

            if timeout < 1:
                raise Exception("Timeout must be positive")
        elif option == "-l":
            length = int(value)

            if length < 1 or (length % 2) != 0:
                raise Exception("Length must be an even number >= 1")
        elif option == "-t":
            ttl = int(value)

            if ttl < 0 or ttl > 255:
                raise Exception("TTL must be >= 1 and <= 255")
        elif option == "-v":
            verbose = True
        elif option == "-i":
            interval = int(value)

            if interval < 0:
                raise Exception("Interval must be >= 0")

    hosts = args

    print("[%s]\n Starting monitor" % (time.asctime()))

    monitor(hosts, timeout, length, ttl, interval, verbose)

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        pass
