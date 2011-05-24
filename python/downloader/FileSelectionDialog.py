# FileSelectionDialog.py - John Finlay (http://www.pygtk.org/pygtk2tutorial/index.html)
# Andrew Pennebaker

import gtk

class FileSelectionDialog:
	PENDING="Pending"
	OK="OK"
	CANCEL="Cancel"

	def __init__(self, titleText="File Selecion", selectionText=""):
		self.state=self.PENDING
		self.fileSelection=gtk.FileSelection(title=titleText)
		self.fileSelection.selection_entry.set_text(selectionText)

		self.fileSelection.ok_button.connect("clicked", self.okEvent)
		self.fileSelection.cancel_button.connect("clicked", self.cancelEvent)

		self.fileSelection.show_all()

		# loop until button clicked
		while self.state==self.PENDING:
			while gtk.events_pending():
				gtk.main_iteration()

	def okEvent(self, widget=None, event=None, data=None):
		self.fileName=self.fileSelection.get_filename()
		self.state=self.OK

		self.fileSelection.destroy()

	def cancelEvent(self, widget=None, event=None, data=None):
		self.state=self.CANCEL

		self.fileSelection.destroy()

	def getFileName(self):
		return self.fileName