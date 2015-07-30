#!/usr/bin/env python

"""Based on ping2.py by Ray Burr (ryb@nightmare.com)"""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "27 Nov 2005 - 22 Jun 2006"
__copyright__ = "Copyright 2006 Andrew Pennebaker"
__version__ = "0.3"

import os
import string
import select
import socket
import sys

import time
import getopt

ETH_P_IP = 0x0800
ETH_P_ALL = 0x0003
SOCK_PACKET = 10
IPPROTO_ICMP = 1

ICMP_ECHOREPLY = 0
ICMP_DEST_UNREACH = 3
ICMP_SOURCE_QUENCH = 4
ICMP_ECHO = 8
ICMP_TIME_EXCEEDED = 11

NULL_REPLY = (False, -1, "")
INFINITE = "INFINITE"
STATUS = {
    True: "up",
    False: "down"
}


def encode_short(num):
    """Converts short to 2-character string"""
    return chr(num / 256) + chr(num % 256)


def decode_short(s):
    """Converts 2-character string to short"""
    return ord(s[0]) * 256 + ord(s[1])


def encode_long(num):
    """Converts long to 4-character string"""
    return encode_short(num / 65536) + encode_short(num % 65536)


def decode_long(s):
    """Converts 4-character string to long"""
    return decode_short(s[0:2]) * 65536 + decode_short(s[2:4])


def encode_address(dot_str):
    """Converts dotted-octet into a four-character string"""
    s = []

    for x in string.splitfields(dot_str, "."):
        s.append(chr(int(x)))

    return "".join(s)


def decode_address(four_char):
    """Converts four-character string into dotted-octet"""
    s = []

    for x in four_char:
        s.append(ord(x))

    return ".".join(["%d" % (e) for e in s])


# borrowed from tcpdump
def checksum(data):
    """TCP checksum"""

    state = 0

    while data:
        state = state + (decode_short(data[0:2]) & 0xffff)

        data = data[2:]
        while state > 0xffff:
            # increment in case of overflows
            state = (state & 0xffff) + (state >> 16)

    return ~state & 0xffff  # invert and remove sign


def create_icmp_packet(data):
    """Pack bits into ICMP packet"""

    packet = (
        chr(ICMP_ECHO) +                        # Type
        chr(0) +                                # Code
        encode_short(0) +                       # Checksum
        encode_short((os.getpid() & 0xffff)) +  # Identifier
        encode_short(0) +                       # Sequence Number
        data                                    # data
    )

    s = checksum(packet)
    packet = packet[0:2] + encode_short(s) + packet[4:]

    return packet


def dump_packet(data):
    """Debug packet"""

    result = ""

    col = -1
    while data:
        if col == 0:
            result += "\n"
        elif col < 0:
            col = 0
            result += "%04x" % (decode_short(data[:2]))
            result += " "
            col = (col + 1) % 4
            data = data[2:]

    return result


def send_echo_request(s, dest_inet_address, data):
    """Send echo request"""

    packet = create_icmp_packet(data)
    s.sendto(packet, (dest_inet_address, socket.AF_INET))


def catch_echo_reply(s, other_address, ident, time_limit):
    """Catch echo reply"""

    updown = True

    identity_string = encode_short(ident)
    deadline = time.time() + time_limit

    rdat = None
    addr = None

    while True:
        time_left = deadline - time.time()

        if time_left <= 0:
            updown = False
            break

        fds = select.select([s], [], [], time_left)

        if not fds[0]:
            updown = False
            break

        rdat, addr = s.recvfrom(512)

        if addr[0] != other_address:
            continue

        ihl = 20

        if rdat[0] != "\x45":
            ihl = (rdat[0] & 0x0f) * 4

        if rdat[ihl] != "\x00":
            continue

        if rdat[ihl + 4: ihl + 6] != identity_string:
            continue

        if checksum(rdat[ihl:]) != 0:
            continue

        break

    return (updown, time_limit - time_left, dump_packet(rdat))


def ping(
        host,
        timeout=2,
        length=56,
        ttl=128
):
    """Send ping"""

    dest_inet_address = None

    try:
        dest_inet_address = socket.gethostbyname(host)
    except socket.gaierror:
        return NULL_REPLY

    data = "\x00" * length

    s = socket.socket(socket.AF_INET, socket.SOCK_RAW, IPPROTO_ICMP)
    s.setsockopt(socket.IPPROTO_IP, socket.IP_MULTICAST_TTL, ttl)

    send_echo_request(s, dest_inet_address, data)

    return catch_echo_reply(
        s,
        dest_inet_address,
        (os.getpid() & 0xffff),
        timeout
    )


def usage():
    """Print usage message"""

    print("Usage: %s [options] <host1 host2 host3 ...>" % (sys.argv[0]))
    print("\n-w wait for timeout <seconds>")
    print("-l length <even bytes>")
    print("-t <ttl>")
    print("-n number <number>")
    print("-v verbose (dump packet)")
    print("-i interval <interval>")
    print("-h --help (usage)")

    sys.exit()


def main():
    """CLI"""

    system_args = sys.argv[1:]  # ignore program name

    hosts = []
    timeout = 2
    length = 56
    ttl = 128
    number = INFINITE
    interval = 0
    verbose = False

    optlist = []
    args = []

    try:
        optlist, args = getopt.getopt(system_args, "w:l:t:n:vi:h", ["help"])
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
        elif option == "-n":
            number = int(value)

            if number < 0:
                raise Exception("Number must be >= 0")
        elif option == "-v":
            verbose = True
        elif option == "-i":
            interval = int(value)

            if interval < 0:
                raise Exception("Interval must be >= 0")

    hosts = args

    i = 0
    while number == INFINITE or i < number:
        for host in hosts:
            updown, journey, packet = ping(host, timeout, length, ttl)

            print("%s up: %s %d ms" % (host, STATUS[updown], journey))

            if verbose:
                print("Data:\n%s" % (packet))

        i += 1
        time.sleep(interval)

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        pass
