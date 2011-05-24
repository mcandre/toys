// KeyLengthDialog
// Andrew Pennebaker
// June 23, 2004 - October 5, 2004

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.util.*;

public class KeyLengthDialog extends JPanel implements ActionListener {
	public static boolean  LOCKED=false;
	public static boolean CUSTOM=true;
	public static int CANCEL_OPTION=0;
	public static int ERROR_OPTION=1;
	public static int APPROVE_OPTION=2;

	private String title="Key Length Dialog";
	private boolean allowCustom=false;
	private int multiple=8;
	private int min=32;
	private int max=1024;
	private Object[] choices={"One"};
	private int index=0;
	private Object choice=choices[index];

	private JDialog dialog=null;
	private JComboBox bitLengthBox=new JComboBox(choices);
	private JButton okButton, cancelButton;

	private String CMD_OK="ok";
	private String CMD_CANCEL="cancel";
	private boolean isDouble=true;
	private int returnValue=CANCEL_OPTION;

	public KeyLengthDialog(Object objs[], int i, boolean b) {
		choices=objs;
		if (i>=0&&i<choices.length)
			index=i;
		allowCustom=b;
	}

	public void setMultiple(int i) {
		if (i>0)
			multiple=i;
	}

	public void setBounds(int a, int b) {
		if (a>0&&b>a) {
			min=a;
			max=b;
		}
	}

	public int showDialog(Component parent, String s) {
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
		labelPanel.add(new JLabel("Choose key length (bits):"));

		bitLengthBox=new JComboBox(choices);
		bitLengthBox.setSelectedIndex(index);
		bitLengthBox.setEditable(allowCustom);
		if (allowCustom)
			bitLengthBox.addActionListener(this);

		JPanel keyLengthPanel=new JPanel();
		keyLengthPanel.setLayout(new BorderLayout());
		keyLengthPanel.setBorder(
			BorderFactory.createEmptyBorder(5, 5, 5, 5)
		);
		keyLengthPanel.add(bitLengthBox);

		dialog.getContentPane().add(labelPanel, BorderLayout.PAGE_START);
		dialog.getContentPane().add(keyLengthPanel, BorderLayout.CENTER);
		dialog.getContentPane().add(makeButtonPanel(), BorderLayout.PAGE_END);

		dialog.getRootPane().setDefaultButton(okButton);

		dialog.pack();
		Windows.centerOnScreen(dialog);
		dialog.show();

		return returnValue;
	}

	public Object getChoice() {
		return choice;
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
		if (allowCustom&&e.getSource()==bitLengthBox) {
			String newLength=(String) bitLengthBox.getSelectedItem();
			int temp=32;
			boolean isANumber=true;
			try {
				temp=Integer.parseInt(newLength);
			}
			catch(Exception ie) {
				isANumber=false;
				JOptionPane.showMessageDialog(
					this,
					"Not a number",
					"Input Error",
					JOptionPane.ERROR_MESSAGE
				);
				bitLengthBox.setSelectedIndex(index);
				returnValue=ERROR_OPTION;
			}
			if (
				isANumber&&
				(temp%multiple!=0||temp<min)
			) {
				JOptionPane.showMessageDialog(
					this,
					newLength+" is not a multiple of "+multiple+" greater than\n"+
					"or equal to "+min+" and less than or equal to "+max+".",
					"Input Error",
					JOptionPane.ERROR_MESSAGE
				);
				bitLengthBox.setSelectedIndex(index);
				returnValue=ERROR_OPTION;
			}
			else if (isANumber) {
				choice=newLength;
				returnValue=APPROVE_OPTION;
			}
		}
		else if (e.getSource()==okButton) {
			choice=bitLengthBox.getSelectedItem();
			returnValue=APPROVE_OPTION;
			dialog.dispose();
		}
		else if (e.getSource()==cancelButton) {
			returnValue=CANCEL_OPTION;
			dialog.dispose();
		}
	}
}