#!/usr/bin/env python

"""Converts long URLs to tiny URLs, with either
tinyurl,
urltea,
or a custom url."""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "22 Jun 2007 - 24 Jun 2007"
__copyright__ = "Copyright 2007 Andrew Pennebaker"
__version__ = "0.0.1"
__URL__ = "http://snippets.dzone.com/posts/show/4195"
__credits__ = "http://lateral.netmanagers.com.ar/weblog/2007/04/08.html#BB548"

import sys
import getopt
import urllib
import configreader

def tiny(url, settings):
  """TinyURL"""

  try:
    encodedurl = settings["posting url"] + urllib.urlencode({ "url": url })
    instream = urllib.urlopen(encodedurl)
    tinyurl = instream.read()
    instream.close()

    if len(tinyurl) == 0:
      return url

    if settings["service"] == "urltea" and len(settings["description"]) > 0:
      tinyurl += settings["description delimeter"]+settings["description"]

    return tinyurl
  except IOError:
    raise Exception("Could not connect.")

def usage():
  """Print usage message"""

  print("Usage: %s [options] <url1> <url2> <url3> ..." % (sys.argv[0]))
  print("\nDefaults to urlTea unless specified in options or a config file.")
  print("\n-s|--service [tinyurl|urltea]")
  print("-u|--custom-url <posting url>")
  print("-d|--description <comment> May only be used with urltea.")
  print("-c|--config <configfile>")
  print("-h|--help (usage)")

  sys.exit()

def main():
  """CLI"""

  system_args = sys.argv[1:]
  args = []

  settings = {
    "config": "tiny.conf",
    "service": "urltea",
    "urltea url": "http://urltea.com/api/text/?url=",
    "tinyurl url": "http://tinyurl.com/api-create.php?",
    "description delimeter": "?",
    "description": ""
  }

  try:
    optlist, args = getopt.getopt(
      system_args,
      "s:u:d:c:h",
      ["service=", "custom-url=", "description=", "config=", "help"]
    )
  except getopt.GetoptError:
    usage()

  for option, value in optlist:
    if option == "-c" or option == "--config":
      settings["config"] = value

  try:
    configreader.load(open(settings["config"], "r"), settings)
  except IOError:
    pass

  for option, value in optlist:
    if option == "-h" or option == "--help":
      usage()
    elif option == "-s" or option == "--service":
      settings["service"] = value
    elif option == "-d" or option == "--description":
      settings["description"] = value

  if settings["service"] != "urltea" and len(settings["description"]) > 0:
    usage()

  try:
    settings["posting url"] = settings[settings["service"] + " url"]
  except:
    usage()

  for option, value in optlist:
    if option == "-u" or option == "--custom-url":
      settings["posting url"] = value

  if len(args) < 1:
    usage()

  for u in args:
    print tiny(u, settings)

if __name__ == "__main__":
  try:
    main()
  except KeyboardInterrupt:
    pass
