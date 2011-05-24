#!/usr/bin/env python

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="13 Apr 2006 - 14 Apr 2006"
__copyright__="Copyright 2006 Andrew Pennebaker"

import os
import gtk

from ProgressDialog import ProgressDialog
from FileSelectionDialog import FileSelectionDialog
import downloader

window=gtk.Window(gtk.WINDOW_TOPLEVEL)
window.set_size_request(400, 70)
window.set_title("Downloader")
window.connect("delete-event", gtk.main_quit)

urlLabel=gtk.Label("URL")
urlEntry=gtk.Entry(max=0) # no max chars

hBox=gtk.HBox()
hBox.pack_start(urlLabel, expand=False, fill=False, padding=5)
hBox.pack_start(urlEntry, expand=True, fill=True, padding=5)

downloadButton=gtk.Button("Download")

def downloadButtonEvent(widget=None, event=None, data=None):
	url=urlEntry.get_text()
	try:
		url, length=downloader.createDownload(url, None)
	except IOError:
		md=gtk.MessageDialog(
			window,
			gtk.DIALOG_MODAL,
			gtk.MESSAGE_ERROR,
			gtk.BUTTONS_OK,
			"Error retrieving url"
		)
		md.run()
		md.destroy()

		return

	fs=FileSelectionDialog("Save", url.url.split("/")[-1])
	if fs.state!=FileSelectionDialog.OK:
		return

	outstream=None
	try:
		outstream=open(fs.getFileName(), "wb")
	except:
		md=gtk.MessageDialog(
			window,
			gtk.DIALOG_MODAL,
			gtk.MESSAGE_ERROR,
			gtk.BUTTONS_OK,
			"Error reading %s" % (fs.getFileName())
		)
		md.run()
		md.destroy()

		return

	pd=ProgressDialog("Downloading", window, url, outstream, outstream.name.split(os.sep)[-1], length)

	if pd.state==ProgressDialog.CANCEL:
		return
	elif pd.state==ProgressDialog.FAILURE:
		md=gtk.MessageDialog(
			window,
			gtk.DIALOG_MODAL,
			gtk.MESSAGE_ERROR,
			gtk.BUTTONS_OK,
			e
		)
		md.run()
		md.destroy()

downloadButton.connect("clicked", downloadButtonEvent)

downloadBox=gtk.HBox()
downloadBox.pack_start(downloadButton, expand=True, fill=False)

vBox=gtk.VBox()
vBox.pack_start(hBox)
vBox.pack_start(downloadBox, padding=5)

window.add(vBox)

window.show_all()

gtk.main()
