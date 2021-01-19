#!/usr/bin/env python

'''Accepts TCP connections and echoes back input.
Warning: uses SHUTDOWN command in echoconstants.py for experimentation.'''

__author__ = 'Andrew Pennebaker (andrew.pennebaker@gmail.com)'
__date__ = '11 Nov 2005'
__copyright__ = 'Copyright 2005 Andrew Pennebaker'
__version__ = '0.1'

import echoconstants
import socket
import sys


def start(host='localhost', port=8000):
    '''Start echo socket'''

    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    print('binding to %s at %d' % (host, port))
    server.bind((host, port))
    print('bound')

    print('listening for connections')
    server.listen(1)  # permits 1 threaded connection
    listening = True

    while listening:
        try:
            print('accepting connections')
            client, address = server.accept()
            print('accepted connection to %s' % (address[0]))

            data = client.recv(echoconstants.BUFFER)
            print('received: %s' % (data))
            client.send(data)
            while (
                    data != echoconstants.EXIT and
                    data != echoconstants.SHUTDOWN
            ):
                data = client.recv(echoconstants.BUFFER)
                print('received: %s' % (data))
                client.send(data)

            print('disconnecting from %s' % (address[0]))
            client.close()
            print('disconnected')

            if data == echoconstants.SHUTDOWN:
                print('closing server')
                server.close()
                print('closed')
                listening = False

        except Exception as e:
            print('error: %s' % (e))

if __name__ == '__main__':
    if len(sys.argv) > 2:
        start(sys.argv[1], int(sys.argv[2]))
    else:
        start()
