#!/usr/bin/env python

# Deprecated in favor of urllib.urlretrieve(url, filename)

"""URL downloader"""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "3 Nov 2005 - 13 Apr 2006"
__copyright__ = "Copyright 2006, Andrew Pennebaker"
__version__ = "0.4"
__URL__ = "http://snippets.dzone.com/posts/show/2887"

from urllib import urlopen

import getopt
import os
import sys

def get_url_name(url):
  """Mirror"""

  directory = os.curdir

  name = "%s%s%s" % (
    directory,
    os.sep,
    url.split("/")[-1]
  )

  return name

def create_download(url, proxy):
  """Setup download"""

  instream = urlopen(url, None, proxy)

  return (instream, instream.info().getheader("Content-Length"))

def download(instream, outstream):
  """Download from a stream to a stream"""

  outstream.write(instream.read())

  instream.close()
  outstream.close()

def usage():
  """Print usage message"""

  print "Usage: %s [options] <url1 url2 url3 ...>" % (sys.argv[0])
  print "\n--httpproxy <proxy>"
  print "--ftpproxy <proxy>"
  print "--gopherproxy <proxy>"
  print "\n--help (usage)"

  sys.exit()

def main():
  """Mirror a URL"""

  system_args = sys.argv[1:] # ignore program name

  urls = []
  proxies = {}

  optlist = []
  args = []

  try:
    optlist, args = getopt.getopt(
      system_args,
      "",
      ["url=", "httpproxy=", "ftpproxy=", "gopherproxy=", "help"]
    )
  except getopt.GetoptError:
    usage()

  if len(args) < 1:
    usage()

  for option, value in optlist:
    if option == "--help":
      usage()

    elif option == "--httpproxy":
      proxies["http"] = value
    elif option == "--ftpproxy":
      proxies["ftp"] = value
    elif option == "--gopherproxy":
      proxies["gopher"] = value

  urls = args

  for url in urls:
    try:
      outfile = open(get_url_name(url), "wb")
      filename = outfile.name.split(os.sep)[-1]

      url, length = create_download(url, proxies)
      if not length:
        length = "?"

      print "Downloading %s (%s bytes) ..." % (url.url, length)
      if length != "?":
        length = float(length)
        bytes_read = 0.0

      for line in url:
        bytes_read += len(line)

        if length != "?":
          print "%s: %.02f/%.02f kb (%d%%)" % (
            filename,
            bytes_read / 1024.0,
            length / 1024.0,
            100 * bytes_read / length
          )

        outfile.write(line)

      url.close()
      outfile.close()
      print "Done"

    except Exception, e:
      print "Error downloading %s: %s" % (url, e)

if __name__ == "__main__":
  main()
