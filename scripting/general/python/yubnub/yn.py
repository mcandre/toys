#!/usr/bin/env python

'''YubNub client'''

from contracts import *
import sys
import getopt
from urllib import urlopen
import webbrowser
from html2txt import html2txt

import os

__author__ = 'Andrew Pennebaker (andrew.pennebaker@gmail.com)'
__date__ = '9 Dec 2006 - 7 Aug 2007'
__copyright__ = 'Copyright 2006 2007 Andrew Pennebaker'
__version__ = '0.0.1'
__credits__ = 'Based on Yubnub for Windows'
' (http://www.opbarnes.com/blog/Programming/OPB/Utilities/yubnub.html)'
__URL__ = 'http://snippets.dzone.com/posts/show/3120'


PARSER = 'http://yubnub.org/parser/parse?command='

BROWSER_MODE = 'BROWSER'
PLAIN_MODE = 'PLAIN'


@contract(s='str')
def space2plus(s):
    '''Convert spaces to plusses'''
    return '+'.join(s.split())


@contract(command='str')
def yubnub(command=''):
    '''Execute YubNub command'''
    return PARSER + space2plus(command)


@contract(command='str')
def yubnub_browser(command):
    '''Open YubNub result in browser'''

    return webbrowser.open(yubnub(command))


@contract(html='str')
def clean_html(html):
    '''Strip HTML tags'''

    h = html2txt()
    h.feed(html)
    h.close()

    return h.output()


@contract(command='str', clean='bool')
def yubnub_plain(command, clean=True):
    '''Output YubNub result to stdout'''

    command = yubnub(command)

    try:
        url = urlopen(command)
        lines = url.readlines()
        url.close()

        lines = ''.join(lines)

        if clean:
            return clean_html(lines)

        return lines

    except IOError:
        return Exception('Error connecting to ' + command)


def usage():
    '''CLI'''

    print('Usage: ' + sys.argv[0] + ' [options] <command>')
    print('-b --browser\n\tdefault mode')
    print('\n=p --plain\n\toutputs page contents')
    print('\t-c --clean\n\treplaces htmlencoded text with natural text')
    print('\t-d --dirty\n\traw html text')
    print('\n--parser <parser>\n\tcustomize parser URL')
    print('\n-h --help')


def main():
    '''CLI'''

    if len(sys.argv) == 0:
        print('error: missing program name')
        os.exit(1)

    mode = BROWSER_MODE
    clean = True

    system_args = sys.argv[1:]
    optlist, args = [], []
    try:
        optlist, args = getopt.getopt(
            system_args,
            'bphcd',
            ['browser', 'plain', 'clean', 'dirty', 'help']
        )
    except getopt.GetoptError:
        usage()
        sys.exit(1)

    for option, value in optlist:
        if option == '-h' or option == '--help':
            usage()
            sys.exit(0)

        elif option == '-b' or option == '--browser':
            mode = BROWSER_MODE
        elif option == '-p' or option == '--plain':
            mode = PLAIN_MODE
        elif option == '-c' or option == '--clean':
            clean = True
        elif option == '-d' or option == '--dirty':
            clean = False

    command = ' '.join(args)

    if mode == BROWSER_MODE:
        yubnub_browser(command)
    elif mode == PLAIN_MODE:
        for line in yubnub_plain(command, clean):
            sys.stdout.write(line)
            print('')


if __name__ == '__main__':
    main()
