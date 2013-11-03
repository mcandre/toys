// PassphraseDialog
// Andrew Pennebaker
// June 22, 2004 - October 5, 2004

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.util.*;

@SuppressWarnings("serial")
public class PassphraseDialog extends JPanel implements ActionListener {
  public static boolean CONFIRM_DIALOG=true;
  public static boolean SINGLE_DIALOG=false;
  public static int CANCEL_OPTION=0;
  public static int ERROR_OPTION=1;
  public static int APPROVE_OPTION=2;

  private String title="Passphrase Dialog";
  private char[] passphrase=null;

  private JDialog dialog=null;
  private final JPasswordField password1=new JPasswordField(15);
  private final JPasswordField password2=new JPasswordField(15);
  private JButton okButton, cancelButton;

  private String CMD_OK="ok";
  private String CMD_CANCEL="cancel";
  private boolean isDouble=true;
  private int returnValue=CANCEL_OPTION;

  public PassphraseDialog() {}

  public int showConfirmDialog(Component parent, String s) {
    return showDialog(parent, s, CONFIRM_DIALOG);
  }

  public int showSingleDialog(Component parent, String s) {
    return showDialog(parent, s, SINGLE_DIALOG);
  }

  public int showDialog(Component parent, String s, boolean b) {
    isDouble=b;
    Frame frame=parent instanceof Frame ? (Frame) parent : (Frame) SwingUtilities.getAncestorOfClass(Frame.class, parent);
    if (s==null||s.equals(""))
      dialog=new JDialog(frame, title, true);
    else
      dialog=new JDialog(frame, s, true);

    dialog.getContentPane().setLayout(new BorderLayout());

    JPanel labelPanel=new JPanel();
    labelPanel.setLayout(new BorderLayout());
    labelPanel.setBorder(
      BorderFactory.createEmptyBorder(5, 5, 5, 5)
    );
    labelPanel.add(new JLabel("Passphrase:"), BorderLayout.NORTH);
    if (isDouble)
      labelPanel.add(new JLabel("Retype:"), BorderLayout.SOUTH);

    JPanel passphrasePanel=new JPanel();
    passphrasePanel.setLayout(new BorderLayout());
    passphrasePanel.setBorder(
      BorderFactory.createEmptyBorder(5, 5, 5, 5)
    );
    passphrasePanel.add(password1, BorderLayout.NORTH);
    if (isDouble)
      passphrasePanel.add(password2, BorderLayout.SOUTH);

    JPanel inputPanel=new JPanel();
    inputPanel.setLayout(new BorderLayout());
    inputPanel.add(labelPanel, BorderLayout.WEST);
    inputPanel.add(passphrasePanel, BorderLayout.EAST);

    dialog.getContentPane().add(inputPanel, BorderLayout.PAGE_START);
    dialog.getContentPane().add(makeButtonPanel(), BorderLayout.PAGE_END);

    dialog.getRootPane().setDefaultButton(okButton);

    dialog.pack();
    Windows.centerOnScreen(dialog);
    dialog.setVisible(true);

    return returnValue;
  }

  public char[] getPassphrase() {
    return passphrase;
  }

  private JPanel makeButtonPanel() {
    JPanel panel=new JPanel();

    okButton=new JButton("Ok");
    okButton.addActionListener(this);
    panel.add(okButton);

    cancelButton=new JButton("Cancel");
    cancelButton.addActionListener(this);
    panel.add(cancelButton);

    return panel;
  }

  public void actionPerformed(ActionEvent e) {
    if (e.getSource()==okButton) {
      char[] temp1=password1.getPassword();
      char[] temp2=null;
      if (isDouble)
        temp2=password2.getPassword();

      if (new String(temp1).equals("")||(isDouble&&new String(temp2).equals(""))) {
        JOptionPane.showMessageDialog(
          this,
          "Passphrase(s) blank",
          "Input Error",
          JOptionPane.ERROR_MESSAGE
        );
        returnValue=ERROR_OPTION;
      }
      else if (isDouble&&!new String(temp1).equals(new String(temp2))) {
        password1.setText("");
        password2.setText("");
        JOptionPane.showMessageDialog(
          this,
          "Passphrases do not match.",
          "Input Error",
          JOptionPane.ERROR_MESSAGE
        );
        returnValue=ERROR_OPTION;
      }
      else {
        passphrase=temp1;
        returnValue=APPROVE_OPTION;
      }

      if (returnValue!=ERROR_OPTION)
        dialog.dispose();
    }
    else if (e.getSource()==cancelButton) {
      returnValue=CANCEL_OPTION;
      dialog.dispose();
    }
  }

  public void wipePassphrase() {
    for (int i=0; i<passphrase.length; i++)
      passphrase[i]=(char) ((int) 'a'+i);
  }
}
