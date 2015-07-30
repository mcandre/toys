#!/usr/bin/env python

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "11 Jul 2006 - 24 Oct 2006"
__copyright__ = "Copyright 2006 Andrew Pennebaker"
__URL__ = "http://snippets.dzone.com/posts/show/2890"

import downloader
from Adler32 import Adler32

import time
import os

PAGE_URL = "http://www.mozilla.com"
SEARCH_STRING = "irefox 2"
MEDIA_PLAYER = "beep-media-player"
SONG = "song 2.ogg"
SOFTWARE_URL = "http://www.mozilla.com/products/download.html"
"?product=firefox-2.0&os=win&lang=en-US"


def message(text=""):
    print "[%s] %s" % (time.asctime(), text)


def main():
    global PAGE_URL
    global SEARCH_STRING
    global MEDIA_PLAYER
    global SONG
    global SOFTWARE_URL

    hasUpdated = False
    includesFF2 = False
    firstHash = None
    currentHash = firstHash

    hasher = Adler32()

    while (not hasUpdated) or (not includesFF2):
        time.sleep(1)  # sec

        try:
            message("checking page")

            down = downloader.createDownload(PAGE_URL)
            instream = down[0]
            outstream = open(os.getcwd() + os.sep + down[1], "wb")

            line = instream.readline()
            includesFF2 = False

            while line != "":
                if SEARCH_STRING in line:
                    includesFF2 = True

                hasher.update(line)
                outstream.write(line)
                line = instream.readline()

            instream.close()
            outstream.close()

            if firstHash is None:
                currentHash = firstHash = hasher.formatDigest()
                message("first hash: " + firstHash)
            else:
                currentHash = hasher.formatDigest()

            hasher.reset()

            if not includesFF2:
                message("proxy page")
            else:
                hasUpdated = (firstHash != currentHash)

                if not hasUpdated:
                    message("static")
        except IOError, e:
            message("connection error")
        except Exception, e:
            message(e)

    message("detected update")
    message("alerting")

    os.popen(MEDIA_PLAYER + " \"" + os.getcwd() + os.sep + SONG + "\"")

    message("alerted")
    message("downloading")

    try:
        down = downloader.createDownload(SOFTWARE_URL)
        instream = down[0]
        outstream = open(os.getcwd() + os.sep + down[1], "wb")
        downloader.download(instream, outstream)

        message("downloaded")
    except:
        message("could not download")

if __name__ == "__main__":
    main()
