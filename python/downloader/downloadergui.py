#!/usr/bin/env python

"""Download GUI"""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "13 Apr 2006 - 14 Apr 2006"
__copyright__ = "Copyright 2006 Andrew Pennebaker"

import os, gtk

from ProgressDialog import ProgressDialog
from FileSelectionDialog import FileSelectionDialog
import downloader

WINDOW = gtk.Window(gtk.WINDOW_TOPLEVEL)
WINDOW.set_size_request(400, 70)
WINDOW.set_title("Downloader")
WINDOW.connect("delete-event", gtk.main_quit)

URL_LABEL = gtk.Label("URL")
URL_ENTRY = gtk.Entry(max = 0) # no max chars

HBOX = gtk.HBox()
HBOX.pack_start(URL_LABEL, expand = False, fill = False, padding = 5)
HBOX.pack_start(URL_ENTRY, expand = True, fill = True, padding = 5)

DOWNLOAD_BUTTON = gtk.Button("Download")

def download_button_event(widget = None, event = None, data = None):
  """Download"""

  url = URL_ENTRY.get_text()
  try:
    url, length = downloader.createDownload(url, None)
  except IOError:
    md = gtk.MessageDialog(
      WINDOW,
      gtk.DIALOG_MODAL,
      gtk.MESSAGE_ERROR,
      gtk.BUTTONS_OK,
      "Error retrieving url"
    )
    md.run()
    md.destroy()

    return

  fs = FileSelectionDialog("Save", url.url.split("/")[-1])
  if fs.state != FileSelectionDialog.OK:
    return

  outstream = None
  try:
    outstream = open(fs.get_filename(), "wb")
  except:
    md = gtk.MessageDialog(
      WINDOW,
      gtk.DIALOG_MODAL,
      gtk.MESSAGE_ERROR,
      gtk.BUTTONS_OK,
      "Error reading %s" % (fs.get_filename())
    )
    md.run()
    md.destroy()

    return

  pd = ProgressDialog(
    "Downloading",
    WINDOW,
    url,
    outstream,
    outstream.name.split(os.sep)[-1],
    length
  )

  if pd.state == ProgressDialog.CANCEL:
    return
  elif pd.state == ProgressDialog.FAILURE:
    md = gtk.MessageDialog(
      WINDOW,
      gtk.DIALOG_MODAL,
      gtk.MESSAGE_ERROR,
      gtk.BUTTONS_OK,
      e
    )
    md.run()
    md.destroy()

DOWNLOAD_BUTTON.connect("clicked", download_button_event)

DOWNLOAD_BOX = gtk.HBox()
DOWNLOAD_BOX.pack_start(DOWNLOAD_BUTTON, expand = True, fill = False)

VBOX = gtk.VBox()
VBOX.pack_start(HBOX)
VBOX.pack_start(DOWNLOAD_BOX, padding = 5)

WINDOW.add(VBOX)

WINDOW.show_all()

gtk.main()
