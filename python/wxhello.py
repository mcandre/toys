#!/usr/bin/env python

import wx

ID_ANY=wx.ID_ANY
ID_HELLO=110

class HelloFrame(wx.Frame):
	def __init__(self, parent, id, title, pos=wx.DefaultPosition, size=(150, 75)):
		wx.Frame.__init__(self, parent, id, title, pos, size)

		self.button=wx.Button(self, ID_HELLO, "Hello World", wx.DefaultPosition, wx.Size(20, 10))

		wx.EVT_BUTTON(self, ID_HELLO, self.OnHello)

		self.Show(True)

	def OnHello(self, event):
		print "Hello World"

if __name__=="__main__":
	app=wx.PySimpleApp()
	frame=HelloFrame(None, ID_ANY, "wxHello")
	app.MainLoop()