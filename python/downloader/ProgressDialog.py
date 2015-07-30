"""Gtk progress window"""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "13 Apr 2006 - 14 Apr 2006"
__copyright__ = "Copyright 2006 Andrew Pennebaker"

import gtk


class ProgressDialog:
    PENDING = "Pending"
    SUCCESS = "Success"
    CANCEL = "Cancel"
    FAILURE = "Failure"

    def __init__(
        self,
        title_text,
        parent_widget,
        instream,
        outstream,
        name,
        length
    ):
        self.state = self.PENDING

        self.dialog = gtk.Dialog(title=title_text, parent=parent_widget)
        self.dialog.set_has_separator(False)

        self.instream = instream
        self.outstream = outstream
        self.name = name
        self.length = length
        self.bytes_read = 0.0

        self.name_label = gtk.Label(self.name)

        self.progress_bar = gtk.ProgressBar()
        self.progress_bar.set_fraction(0.0)
        if not self.length:
            self.length = "?"
            self.progress_bar.set_text("0.00 kb")
        else:
            self.length = float(self.length)
            self.progress_bar.set_text(
                "%.02f/%.02f kb (%d%%)" % (
                    self.bytes_read / 1024.0,
                    self.length / 1024.0,
                    100 * self.bytes_read / self.length
                )
            )

        self.cancel_button = gtk.Button("Cancel")
        self.cancel_button.connect("clicked", self.cancel_button_event)

        self.cancel_box = gtk.HBox()
        self.cancel_box.pack_start(self.cancel_button, expand=True, fill=False)

        self.dialog.vbox.pack_start(self.name_label, padding=5)
        self.dialog.vbox.pack_start(self.progress_bar, padding=5)
        self.dialog.vbox.pack_start(self.cancel_box)

        self.dialog.show_all()

        try:
            while (
                    self.state == self.PENDING and
                    (self.instream.fp is not None)
            ):
                line = self.instream.read(1024)
                if line == "":
                    break

                self.bytes_read += len(line)

                if self.length != "?":
                    self.progress_bar.set_fraction(
                        self.bytes_read / self.length
                    )
                    self.progress_bar.set_text(
                        "%.02f/%.02f kb (%d%%)" % (
                            self.bytes_read / 1024.0,
                            self.length / 1024.0,
                            100 * self.bytes_read / self.length
                        )
                    )
                else:
                    self.progress_bar.set_text(
                        "%.02f kb" % (self.bytes_read / 1024.0)
                    )

                self.outstream.write(line)

                while gtk.events_pending():
                    gtk.main_iteration()

            if self.state != self.CANCEL:
                self.instream.close()
                self.outstream.close()

                self.state == self.SUCCESS

                self.progress_bar.set_fraction(1.0)
                self.progress_bar.set_text(
                    "%.02f kb" % (self.bytes_read / 1024.0)
                )

                self.delete_event()
        except:
            self.status = self.FAILURE
            self.delete_event()

    def delete_event(self, widget=None, event=None, data=None):
        self.dialog.destroy()

        return False

    def cancel_button_event(self, widget=None, event=None, data=None):
        self.state = self.CANCEL

        self.instream.close()
        self.outstream.close()

        self.delete_event()
