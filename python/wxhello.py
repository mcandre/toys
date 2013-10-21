#!/usr/bin/env python

"""Wx demo"""

import wx

ID_ANY = wx.ID_ANY
ID_HELLO = 110

class HelloFrame(wx.Frame):
  """Hello frame"""

  def __init__(
      self,
      parent,
      id,
      title,
      pos = wx.DefaultPosition, size = (150, 75)
  ):
    wx.Frame.__init__(self, parent, id, title, pos, size)

    self.button = wx.Button(
      self,
      ID_HELLO,
      "Hello World",
      wx.DefaultPosition,
      wx.Size(20, 10)
    )

    wx.EVT_BUTTON(self, ID_HELLO, self.on_hello)

    self.Show(True)

  def on_hello(self, event):
    """Hello click"""
    print("Hello World!")

def main():
  """GUI"""

  app = wx.PySimpleApp()
  HelloFrame(None, ID_ANY, "wxHello")
  app.MainLoop()

if __name__ == "__main__":
  main()
