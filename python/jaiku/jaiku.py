#!/usr/bin/env python

'''Interface with Jaiku API'''

__author__ = 'Andrew Pennebaker (andrew.pennebaker@gmail.com)'
__date__ = '28 Jun 2007'
__copyright__ = 'Copyright 2007 Andrew Pennebaker'
__version__ = '0.0.1'
__URL__ = 'http://snippets.dzone.com/posts/show/4223'

import configreader

import sys
import getopt
import urllib2
import xmlrpclib

STATUS_MODE = 'STATUS'
VIEW_MODE = 'VIEW'


def set_status(settings, status):
    '''Set Jaiku status'''

    s = xmlrpclib.ServerProxy(settings['xmlrpcurl'])

    calldata = {
        'user': settings['username'],
        'personal_key': settings['personalkey'],
        'message': status,
        'location': settings['location']
    }

    try:
        s.presence.send(calldata)
    except:
        raise Exception('Could not connect.')


def view_status(settings):
    '''View Jaiku status'''

    item = settings['itemdelimeter']
    t1 = settings['titledelimeter1']
    t2 = settings['titledelimeter2']

    try:
        instream = urllib2.urlopen(
            settings['feedurlstart'] +
            settings['username'] +
            settings['feedurlend']
        )

        for line in instream:
            if item in line:
                break

        title = instream.readline()

        instream.close()

        status = title[title.index(t1) + len(t1):title.index(t2)]

        return status

    except IOError:
        raise Exception('Could not connect.')


def usage():
    '''Print usage message'''

    print('Usage: %s [options]' % (sys.argv[0]))
    print('\nWithout any options, uses status mode.')
    print('Leftover args are concatenated to form message.')
    print('\n-u|--username <username> specified in jaiku.conf')
    print('-p|--personal-key <key>')
    print('-l|--location <location>')
    print('-s|--status mode')
    print('-v|--view status')
    print('-c|--config <configfile>')
    print('-h|--help')

    sys.exit()


def main():
    '''Jaiku CLI'''

    system_args = sys.argv[1:]

    mode = STATUS_MODE

    settings = {
        'config': 'jaiku.conf',
        'xmlrpcurl': 'http: //api.jaiku.com/xmlrpc',
        'feedurlstart': 'http: //',
        'feedurlend': '.jaiku.com/feed/atom',
        'itemdelimeter': '<entry>',
        'titledelimeter1': '<title>',
        'titledelimeter2': '</title>',
        'username': 'mcandre',
        'personalkey': '',
        'location': ''
    }

    optlist, args = [], []

    try:
        optlist, args = getopt.getopt(
            system_args,
            'u:p:l:svc:h',
            [
                'username=',
                'personal-key=',
                'location=',
                'status',
                'view',
                'config=',
                'help'
            ]
        )
    except getopt.GetoptError:
        usage()

    for option, value in optlist:
        if option == '-c' or option == '--config':
            settings['config'] = value

    try:
        configreader.load(open(settings['config'], 'r'), settings)
    except IOError:
        pass

    for option, value in optlist:
        if option == '-h' or option == '--help':
            usage()

        elif option == '-u' or option == '--username':
            settings['username'] = value
        elif option == '-p' or option == '--personal-key':
            settings['personalkey'] = value
        elif option == '-l' or option == '--location':
            settings['location'] = value
        elif option == '-s' or option == '--status':
            mode = STATUS_MODE
        elif option == '-v' or option == '--view':
            mode = VIEW_MODE

    if mode == STATUS_MODE:
        if len(args) < 1:
            usage()

        message = ' '.join(args)

        set_status(settings, message)
    elif mode == VIEW_MODE:
        print(view_status(settings))

if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        pass
