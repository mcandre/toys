package us.yellosoft.dialogs;

import us.yellosoft.Windows;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.util.*;

/** GUI Passphrase entry dialog */
@SuppressWarnings("serial")
public class PassphraseDialog extends JPanel implements ActionListener {
    /** Confirmation enabled */
    public static final boolean CONFIRM_DIALOG = true;
    /** Multimode */
    public static final boolean SINGLE_DIALOG = false;
    /** Cancel */
    public static final int CANCEL_OPTION = 0;
    /** Error */
    public static final int ERROR_OPTION = 1;
    /** Approve */
    public static final int APPROVE_OPTION = 2;
    /** OK text */
    public static final String CMD_OK = "Ok";
    /** Cancel text */
    public static final String CMD_CANCEL = "Cancel";

    private String title = "Passphrase Dialog";
    private char[] passphrase = null;

    private JDialog dialog = null;
    private final JPasswordField password1 = new JPasswordField(15);
    private final JPasswordField password2 = new JPasswordField(15);
    private JButton okButton, cancelButton;

    private boolean isDouble = true;
    private int returnValue = CANCEL_OPTION;

    /**
    * <p>Present GUI confirmation dialog</p>
    * @param parent GUI parent widget
    * @param s confirmation text
    * @return GUI response
    */
    public final int showConfirmDialog(final Component parent, final String s) {
        return showDialog(parent, s, CONFIRM_DIALOG);
    }

    /**
    * <p>Present single GUI dialog</p>
    * @param parent GUI parent widget
    * @param s message text
    * @return GUI response
    */
    public final int showSingleDialog(final Component parent, final String s) {
        return showDialog(parent, s, SINGLE_DIALOG);
    }

    /**
    * <p>Present GUI dialog</p>
    * @param parent GUI parent widget
    * @param s message text
    * @param b toggle double/single
    * @return GUI response
    */
    public final int showDialog(final Component parent, final String s,
                                                            final boolean b) {
        isDouble = b;

        Frame frame = (Frame) SwingUtilities.getAncestorOfClass(Frame.class, parent);

        if (s == null || s.equals("")) {
            dialog = new JDialog(frame, title, true);
        } else {
            dialog = new JDialog(frame, s, true);
        }

        dialog.getContentPane().setLayout(new BorderLayout());

        JPanel labelPanel = new JPanel();
        labelPanel.setLayout(new BorderLayout());
        labelPanel.setBorder(
            BorderFactory.createEmptyBorder(5, 5, 5, 5)
        );
        labelPanel.add(new JLabel("Passphrase:"), BorderLayout.NORTH);

        if (isDouble) {
            labelPanel.add(new JLabel("Retype:"), BorderLayout.SOUTH);
        }

        JPanel passphrasePanel = new JPanel();
        passphrasePanel.setLayout(new BorderLayout());
        passphrasePanel.setBorder(
            BorderFactory.createEmptyBorder(5, 5, 5, 5)
        );
        passphrasePanel.add(password1, BorderLayout.NORTH);

        if (isDouble) {
            passphrasePanel.add(password2, BorderLayout.SOUTH);
        }

        JPanel inputPanel = new JPanel();
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

    /**
    * <p>Get passphrase</p>
    * @return passphrase, in characters
    */
    public final char[] getPassphrase() {
        return passphrase;
    }

    /**
    * <p>Generate button panel</p>
    * @return panel
    */
    private JPanel makeButtonPanel() {
        JPanel panel = new JPanel();

        okButton = new JButton(CMD_OK);
        okButton.addActionListener(this);
        panel.add(okButton);

        cancelButton = new JButton(CMD_CANCEL);
        cancelButton.addActionListener(this);
        panel.add(cancelButton);

        return panel;
    }

    /**
    * <p>Respond to GUI events</p>
    * @param e GUI event
    */
    public final void actionPerformed(final ActionEvent e) {
        if (e.getSource() == okButton) {
            char[] temp1 = password1.getPassword();
            char[] temp2 = null;

            if (isDouble) {
                temp2 = password2.getPassword();
            }

            if (new String(temp1).equals("") || (isDouble && new String(temp2).equals(""))) {
                JOptionPane.showMessageDialog(
                    this,
                    "Passphrase(s) blank",
                    "Input Error",
                    JOptionPane.ERROR_MESSAGE
                );
                returnValue = ERROR_OPTION;
            } else if (isDouble && !new String(temp1).equals(new String(temp2))) {
                password1.setText("");
                password2.setText("");
                JOptionPane.showMessageDialog(
                    this,
                    "Passphrases do not match.",
                    "Input Error",
                    JOptionPane.ERROR_MESSAGE
                );
                returnValue = ERROR_OPTION;
            } else {
                passphrase = temp1;
                returnValue = APPROVE_OPTION;
            }

            if (returnValue != ERROR_OPTION) {
                dialog.dispose();
            }
        } else if (e.getSource() == cancelButton) {
            returnValue = CANCEL_OPTION;
            dialog.dispose();
        }
    }

    /** Erase passphrase from memory */
    public final void wipePassphrase() {
        for (int i = 0; i < passphrase.length; i++) {
            passphrase[i] = (char)((int) 'a' + i);
        }
    }
}
