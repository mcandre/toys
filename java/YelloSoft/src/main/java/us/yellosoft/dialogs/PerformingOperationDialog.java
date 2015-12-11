package us.yellosoft.dialogs;

import us.yellosoft.Windows;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

/** GUI Progress tracker */
public class PerformingOperationDialog extends JPanel {
  /** Starting HTML tag */
  public static final String START_HTML = "<html><font color=blue><font size=+2>";
  /** Ending HTML tag */
  public static final String END_HTML = "</font></html>";

  private String title = "Performing Operation";
  private String labelText = "A long task is completing. Please wait.";

  private JDialog dialog = null;
  private JLabel label = null;

  /**
     <p>Set title</p>
     @param t title
  */
  public final void setTitle(final String t) {
    title = t;
  }

  /**
     <p>Set label text</p>
     @param l label text
  */
  public final void setLabelText(final String l) {
    labelText = l;
  }

  /**
     <p>Show tracker</p>
     @param parent GUI parent widget
  */
  public final void show(final Component parent) {
    Frame frame = (Frame) SwingUtilities.getAncestorOfClass(Frame.class, parent);

    dialog.getContentPane().setLayout(new BorderLayout());

    label = new JLabel(START_HTML + labelText + END_HTML);

    JPanel labelPanel = new JPanel();
    labelPanel.setLayout(new BorderLayout());
    labelPanel.setBorder(
      BorderFactory.createEmptyBorder(20, 20, 20, 20)
    );
    labelPanel.add(label, BorderLayout.CENTER);

    dialog.getContentPane().add(labelPanel, BorderLayout.CENTER);

    dialog.pack();
    Windows.centerOnScreen(dialog);
    dialog.show();
  }

  /** Hide tracker */
  public final void hide() {
    dialog.dispose();
  }
}
