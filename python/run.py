#!/usr/bin/env python

"""Command runner"""

import Tkinter

import os

class App:
  """App"""

  def __init__(self, master):
    self.frame = Tkinter.Frame(master)

    self.input_frame = Tkinter.Frame(self.frame)

    self.command_entry = Tkinter.Entry(self.input_frame, width = 58)
    self.command_entry.pack(side = Tkinter.LEFT)

    self.command_button = Tkinter.Button(
      self.input_frame,
      text = "Call",
      command = self.call
    )
    self.command_button.pack(side = Tkinter.RIGHT)

    self.input_frame.pack(side = Tkinter.TOP)

    self.result_frame = Tkinter.Frame(self.frame)

    self.result_text = Tkinter.Text(self.result_frame, width = 60)
    self.result_text.pack(side = Tkinter.LEFT)
    self.scroll_vert = Tkinter.Scrollbar(
      self.result_frame,
      orient = Tkinter.VERTICAL,
      command = self.result_text.yview
    )
    self.result_text.configure(yscrollcommand = self.scroll_vert.set)
    self.scroll_vert.pack(side = Tkinter.RIGHT, fill = Tkinter.Y)

    self.result_frame.pack(side = Tkinter.BOTTOM, fill = Tkinter.BOTH)

    self.frame.pack()

  def call(self):
    """Execute"""

    command = self.command_entry.get()

    proc = os.popen(command)
    result = "".join(proc.readlines())
    proc.close()

    self.result_text.delete(1.0, Tkinter.END)
    self.result_text.insert(1.0, result)

def main():
  """GUI"""

  root = Tkinter.Tk()
  App(root)

  root.mainloop()

if __name__ == "__main__":
  main()
