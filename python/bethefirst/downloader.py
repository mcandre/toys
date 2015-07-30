#!/usr/bin/env python

__author__ = 'Andrew Pennebaker (andrew.pennebaker@gmail.com)'
__date__ = '3 Nov 2005 - 14 Feb 2007'
__copyright__ = 'Copyright 2006 2007 Andrew Pennebaker'
__version__ = '0.5'
__URL__ = 'http://snippets.dzone.com/posts/show/2887'

from urllib import urlopen

import os

import sys
from getopt import getopt


def getURLName(url):
    directory = os.curdir

    name = '%s%s%s' % (
        directory,
        os.sep,
        url.split('/')[-1]
    )

    return name


def createDownload(url, proxy=None):
    instream = urlopen(url, None, proxy)

    filename = instream.info().getheader('Content-Length')
    if filename is None:
        filename = 'temp'

    return (instream, filename)


def download(instream, outstream):
    outstream.write(instream.read())

    outstream.close()


def usage():
    print('Usage: %s [options] <url1 url2 url3 ...>' % (sys.argv[0]))
    print('\n--httpproxy <proxy>')
    print('--ftpproxy <proxy>')
    print('--gopherproxy <proxy>')
    print('\n--help (usage)')

    sys.exit()


def main():
    systemArgs = sys.argv[1:]  # ignore program name

    urls = []
    proxies = {}

    optlist = []
    args = []

    try:
        optlist, args = getopt(
            systemArgs,
            '',
            ['url=', 'httpproxy=', 'ftpproxy=', 'gopherproxy=', 'help']
        )
    except Exception:
        usage()

    if len(args) < 1:
        usage()

    for option, value in optlist:
        if option == '--help':
            usage()

        elif option == '--httpproxy':
            proxies['http'] = value
        elif option == '--ftpproxy':
            proxies['ftp'] = value
        elif option == '--gopherproxy':
            proxies['gopher'] = value

    urls = args

    for url in urls:
        try:
            outfile = open(getURLName(url), 'wb')
            fileName = outfile.name.split(os.sep)[-1]

            url, length = createDownload(url, proxies)
            if not length:
                length = '?'

            print('Downloading %s (%s bytes) ...' % (url.url, length))

            if length != '?':
                length = float(length)
            bytesRead = 0.0

            for line in url:
                bytesRead += len(line)

                if length != '?':
                    print(
                        '%s: %.02f/%.02f kb (%d%%)' % (
                            fileName,
                            bytesRead / 1024.0,
                            length / 1024.0,
                            100 * bytesRead / length
                        )
                    )

                outfile.write(line)

            url.close()
            outfile.close()

            print('Done')

        except Exception as e:
            print('Error downloading %s: %s' % (url, e))

if __name__ == '__main__':
    main()
