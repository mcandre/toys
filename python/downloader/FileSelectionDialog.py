# FileSelectionDialog.py
# John Finlay (http://www.pygtk.org/pygtk2tutorial/index.html)
# Andrew Pennebaker

"""Launch Gtk file selection window"""

import gtk


class FileSelectionDialog:
    """Implement dialog"""

    PENDING = "Pending"
    OK = "OK"
    CANCEL = "Cancel"

    def __init__(self, title_text="File Selecion", selection_text=""):
        self.state = self.PENDING
        self.file_selection = gtk.FileSelection(title=title_text)
        self.file_selection.selection_entry.set_text(selection_text)

        self.file_selection.ok_button.connect("clicked", self.ok_event)
        self.file_selection.cancel_button.connect("clicked", self.cancel_event)

        self.file_selection.show_all()

        # loop until button clicked
        while self.state == self.PENDING:
            while gtk.events_pending():
                gtk.main_iteration()

    def ok_event(self, widget=None, event=None, data=None):
        """Close on OK"""

        self.file_name = self.file_selection.get_filename()
        self.state = self.OK

        self.file_selection.destroy()

    def cancel_event(self, widget=None, event=None, data=None):
        """Close on Cancel"""

        self.state = self.CANCEL

        self.file_selection.destroy()

    def get_filename(self):
        """Access filename"""

        return self.file_name
