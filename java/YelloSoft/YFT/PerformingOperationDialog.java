// PerformingOperationDialog
// Andrew Pennebaker
// July 13, 2004

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class PerformingOperationDialog extends JPanel {
  public static String startHTML="<html><font color=blue><font size=+2>";
  public static String endHTML="</font></html>";

  private String title="Performing Operation";
  private String labelText="A long task is completing. Please wait.";

  private JDialog dialog=null;
  private JLabel label=null;

  public void setTitle(String t) {
    title=t;
  }

  public void setLabelText(String l) {
    labelText=l;
  }

  public void show(Component parent) {
    Frame frame=parent instanceof Frame ? (Frame) parent : (Frame) SwingUtilities.getAncestorOfClass(Frame.class, parent);

    dialog.getContentPane().setLayout(new BorderLayout());

    label=new JLabel(startHTML+labelText+endHTML);

    JPanel labelPanel=new JPanel();
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

  public void hide() {
    dialog.dispose();
  }
}
