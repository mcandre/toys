#!/usr/bin/env python

"""Progress window test"""

import gtk

import urllib

from ProgressDialog import ProgressDialog

FILE = open("./output.txt", "wb")

URL = urllib.urlopen("http://www.pygtk.org/dist/pygtk2-tut.pdf")
LENGTH = URL.info().getheader("Content-Length")

window = gtk.Window()
window.set_title("Parent")
window.connect("delete-event", gtk.main_quit)
window.show_all()

RESULT = ProgressDialog("Downloading", window, URL, FILE, "./output.txt", LENGTH)

print(RESULT.status)

gtk.main()
