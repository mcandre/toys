#!/usr/bin/env python

import os

from Tkinter import *

class App:
	def __init__(self, master):
		self.frame=Frame(master)

		self.inputFrame=Frame(self.frame)

		self.commandEntry=Entry(self.inputFrame, width=58)
		self.commandEntry.pack(side=LEFT)

		self.commandButton=Button(self.inputFrame, text="Call", command=self.call)
		self.commandButton.pack(side=RIGHT)

		self.inputFrame.pack(side=TOP)

		self.resultFrame=Frame(self.frame)

		self.resultText=Text(self.resultFrame, width=60)
		self.resultText.pack(side=LEFT)
		self.scrollVert=Scrollbar(self.resultFrame, orient=VERTICAL, command=self.resultText.yview)
		self.resultText.configure(yscrollcommand=self.scrollVert.set)
		self.scrollVert.pack(side=RIGHT, fill=Y)

		self.resultFrame.pack(side=BOTTOM, fill=BOTH)

		self.frame.pack()

	def call(self):
		command=self.commandEntry.get()

		proc=os.popen(command)
		result="".join(proc.readlines())
		proc.close()

		self.resultText.delete(1.0, END)
		self.resultText.insert(1.0, result)

def main():
	root=Tk()
	app=App(root)

	root.mainloop()

if __name__=="__main__":
	main()