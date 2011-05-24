__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="13 Apr 2006 - 14 Apr 2006"
__copyright__="Copyright 2006 Andrew Pennebaker"

import gtk

class ProgressDialog:
	PENDING="Pending"
	SUCCESS="Success"
	CANCEL="Cancel"
	FAILURE="Failure"

	def __init__(self, titleText, parentWidget, instream, outstream, name, length):
		self.state=self.PENDING

		self.dialog=gtk.Dialog(title=titleText, parent=parentWidget)
		self.dialog.set_has_separator(False)

		self.instream=instream
		self.outstream=outstream
		self.name=name
		self.length=length
		self.bytesRead=0.0

		self.nameLabel=gtk.Label(self.name)

		self.progressBar=gtk.ProgressBar()
		self.progressBar.set_fraction(0.0)
		if not self.length:
			self.length="?"
			self.progressBar.set_text("0.00 kb")
		else:
			self.length=float(self.length)
			self.progressBar.set_text(
				"%.02f/%.02f kb (%d%%)" % (
					self.bytesRead/1024.0,
					self.length/1024.0,
					100*self.bytesRead/self.length
				)
			)

		self.cancelButton=gtk.Button("Cancel")
		self.cancelButton.connect("clicked", self.cancelButtonEvent)

		self.cancelBox=gtk.HBox()
		self.cancelBox.pack_start(self.cancelButton, expand=True, fill=False)

		self.dialog.vbox.pack_start(self.nameLabel, padding=5)
		self.dialog.vbox.pack_start(self.progressBar, padding=5)
		self.dialog.vbox.pack_start(self.cancelBox)

		self.dialog.show_all()

		try:
			while self.state==self.PENDING and (self.instream.fp!=None):
				line=self.instream.read(1024)
				if line=="":
					break

				self.bytesRead+=len(line)

				if self.length!="?":
					self.progressBar.set_fraction(self.bytesRead/self.length)
					self.progressBar.set_text(
						"%.02f/%.02f kb (%d%%)" % (
							self.bytesRead/1024.0,
							self.length/1024.0,
							100*self.bytesRead/self.length
						)
					)
				else:
					self.progressBar.set_text("%.02f kb" % (self.bytesRead/1024.0))

				self.outstream.write(line)

				while gtk.events_pending():
					gtk.main_iteration()

			if self.state!=self.CANCEL:
				self.instream.close()
				self.outstream.close()

				self.state==self.SUCCESS

				self.progressBar.set_fraction(1.0)
				self.progressBar.set_text("%.02f kb" % (self.bytesRead/1024.0))

				self.deleteEvent()
		except:
			self.status=self.FAILURE
			self.deleteEvent()

	def deleteEvent(self, widget=None, event=None, data=None):
		self.dialog.destroy()

		return False

	def cancelButtonEvent(self, widget=None, event=None, data=None):
		self.state=self.CANCEL

		self.instream.close()
		self.outstream.close()

		self.deleteEvent()
