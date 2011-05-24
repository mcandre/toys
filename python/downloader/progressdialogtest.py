#!/usr/bin/env python

import gtk

import urllib

from ProgressDialog import ProgressDialog

f=open(".\output.txt", "wb")

url=urllib.urlopen("http://www.pygtk.org/dist/pygtk2-tut.pdf")
length=url.info().getheader("Content-Length")

window=gtk.Window()
window.set_title("Parent")
window.connect("delete-event", gtk.main_quit)
window.show_all()

result=ProgressDialog("Downloading", window, url, f, ".\output.txt", length)

print result.status

gtk.main()