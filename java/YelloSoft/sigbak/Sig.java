// Sig
// Andrew Pennebaker
// June 14, 2004 - July 5, 2004

import java.io.*;
import java.security.*;
import java.security.interfaces.*;
import java.security.spec.*;
import javax.crypto.*;
import javax.crypto.spec.*;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.filechooser.*;

public class Sig extends JPanel implements ActionListener {
	JComboBox keyBox, mdBox;
	JCheckBox passphraseButton;
	JTextField verifyField;

	static JButton signButton; // allows signButton to be default

	JButton verifyButton;

	public Sig() {
		super(new BorderLayout());

		String keyAlgorithms[]={
			"RSA",
			"DSA",
			"ElGamal"
		};

		keyBox=new JComboBox(keyAlgorithms);
		keyBox.setSelectedIndex(0);
		keyBox.addActionListener(this);

		String mdAlgorithms[]={
			"SHA1",
			"MD5",
			"MD2",
		};

		mdBox=new JComboBox(mdAlgorithms);
		mdBox.setSelectedIndex(0);
		mdBox.addActionListener(this);

		JPanel keyBoxPanel=new JPanel();
		keyBoxPanel.setLayout(new BoxLayout(keyBoxPanel, BoxLayout.PAGE_AXIS));
		keyBoxPanel.setBorder(
			BorderFactory.createCompoundBorder(
				BorderFactory.createTitledBorder("Key"),
				BorderFactory.createEmptyBorder(5, 5, 5, 5)
			)
		);
		keyBoxPanel.add(keyBox);

		JPanel mdBoxPanel=new JPanel();
		mdBoxPanel.setLayout(new BoxLayout(mdBoxPanel, BoxLayout.PAGE_AXIS));
		mdBoxPanel.setBorder(
			BorderFactory.createCompoundBorder(
				BorderFactory.createTitledBorder("Digest"),
				BorderFactory.createEmptyBorder(5, 5, 5, 5)
			)
		);
		mdBoxPanel.add(mdBox);

		JPanel sigPanel=new JPanel();
		sigPanel.setLayout(new BorderLayout());
		sigPanel.add(keyBoxPanel, BorderLayout.WEST);
		sigPanel.add(mdBoxPanel, BorderLayout.EAST);

		passphraseButton=new JCheckBox("Key has passphrase");
		passphraseButton.setMnemonic('p'); // ALT+p
		passphraseButton.setSelected(true);

		JPanel passphrasePanel=new JPanel();
		passphrasePanel.setBorder(
			BorderFactory.createEmptyBorder(5, 5, 5, 5)
		);
		passphrasePanel.setLayout(new BorderLayout());
		passphrasePanel.add(passphraseButton, BorderLayout.WEST);

		JPanel optPanel=new JPanel();
		optPanel.setLayout(new BorderLayout());
		optPanel.add(sigPanel, BorderLayout.NORTH);
		optPanel.add(passphrasePanel, BorderLayout.SOUTH);

		verifyField=new JTextField(12);
		verifyField.setToolTipText(
			"<html>Verification:<br>"+
			"true = file was signed by a key's owner<br>"+
			"false = file was not signed by a key's owner </html>"
		);
		verifyField.setEditable(false);

		JPanel verifyPanel=new JPanel();
		verifyPanel.setBorder(
			BorderFactory.createCompoundBorder(
				BorderFactory.createTitledBorder("Verified"),
				BorderFactory.createEmptyBorder(0, 5, 5, 5)
			)
		);
		verifyPanel.add(verifyField);

		signButton=new JButton("Sign");
		signButton.setMnemonic('s'); // ALT+s
		signButton.addActionListener(this);
		verifyButton=new JButton("Verify");
		verifyButton.setMnemonic('v'); // ALT+v
		verifyButton.addActionListener(this);

		JPanel calcPanel=new JPanel();
		calcPanel.add(signButton);
		calcPanel.add(verifyButton);

		add(optPanel, BorderLayout.PAGE_START);
		add(verifyPanel, BorderLayout.CENTER);
		add(calcPanel, BorderLayout.PAGE_END);
	}

	public void actionPerformed(ActionEvent ae) {
		if (ae.getSource()==keyBox) {
			String keyAlg=(String) keyBox.getSelectedItem();
			if (keyAlg.equals("DSA")) {
				mdBox.setEnabled(false);
				mdBox.setSelectedIndex(0);
			}
			else
				mdBox.setEnabled(true);
		}
		else if (ae.getSource()==signButton) {
			String keyAlg=(String) keyBox.getSelectedItem();
			String mdAlg=(String) mdBox.getSelectedItem();
			boolean hasPass=passphraseButton.isSelected();
			if (keyAlg.equals("ElGamal")&&mdAlg.equals("SHA1")) mdAlg="SHA-1";

			sign(keyAlg, mdAlg, hasPass);
		}
		else if (ae.getSource()==verifyButton) {
			String keyAlg=(String) keyBox.getSelectedItem();
			String mdAlg=(String) mdBox.getSelectedItem();
			if (keyAlg.equals("ElGamal")&&mdAlg.equals("SHA1")) mdAlg="SHA-1";

			verify(keyAlg, mdAlg);
		}
	}

	public void sign(String keyAlgorithm, String mdAlgorithm, boolean hasPassphrase) {
		Signature sig=null;
		String instance="";
		boolean useCryptix=false;
		if (
			keyAlgorithm.equals("ElGamal")||
			mdAlgorithm.equals("MD2")
		) {
			instance=mdAlgorithm+"/"+keyAlgorithm+"/PKCS#1";
			useCryptix=true;
		}
		else
			instance=mdAlgorithm+"with"+keyAlgorithm;
		try {
			if (useCryptix)
				sig=Signature.getInstance(instance, "Cryptix");
			else
				sig=Signature.getInstance(instance);
		}
		catch(NoSuchProviderException e) {}
		catch(NoSuchAlgorithmException e) {
			JOptionPane.showMessageDialog(
				Sig.this,
				"No provider found for "+instance+".",
				"Provider Error",
				JOptionPane.ERROR_MESSAGE
			);
		}

		if (sig!=null) {
			// get default directories
			String defaultPrivateDir="", defaultFileDir="", defaultSigDir="", defaultPublicDir="";
			BufferedReader dirBR=AIO.open("dir.dat");
			boolean defaultDirsFound= (dirBR!=null);

			if (defaultDirsFound) {
				defaultPrivateDir=AIO.read(dirBR);
				defaultFileDir=AIO.read(dirBR);
				defaultSigDir=AIO.read(dirBR);
				defaultPublicDir=AIO.read(dirBR);
			}

			try {
				if (dirBR!=null)
					dirBR.close();
			}
			catch(IOException e) {}

			// open private key
			JFileChooser fc=new JFileChooser(defaultPrivateDir);
			fc.setDialogTitle("Open Private Key");
			fc.setFileFilter(new PrivateKeyFilter());
			int valKeyOpen=fc.showOpenDialog(Sig.this);
			if (valKeyOpen==JFileChooser.APPROVE_OPTION) {
				File keyFile=fc.getSelectedFile();

				// read private key
				PrivateKey key=null;

				if (hasPassphrase) {
					PassphraseDialog pd=new PassphraseDialog();
					int valInput=pd.showSingleDialog(Sig.this, "Enter passphrase");
					if (valInput==PassphraseDialog.APPROVE_OPTION) {
						char[] passphrase=pd.getPassphrase();

						if (passphrase!=null) {
							String pbeAlgorithm="PBEwithMD5andDES";

							byte[] salt=new byte[8];
							int iterations=20;

							PBEKeySpec ks=new PBEKeySpec(passphrase);
							SecretKeyFactory skf=null;
							try {
								skf=SecretKeyFactory.getInstance(pbeAlgorithm);
							}
							catch(NoSuchAlgorithmException e) {
								JOptionPane.showMessageDialog(
									Sig.this,
									"No provider found for "+pbeAlgorithm+".",
									"Secret Key Error",
									JOptionPane.ERROR_MESSAGE
								);
							}

							if (skf!=null) {
								SecretKey pbeKey=null;
								try {
									pbeKey=skf.generateSecret(ks);
								}
								catch(InvalidKeySpecException e) {}
								// read key file
								FileInputStream fileIn=null;
								try {
									fileIn=new FileInputStream(keyFile);
								}
								catch(IOException e) {}

								int len=0;
								try {
									len=fileIn.available();
								}
								catch(IOException e) {}

								byte[] input=new byte[len-8];
								try {
									fileIn.read(salt);
									fileIn.read(input);
								}
								catch(IOException e) {}

								// decrypt private key
								PBEParameterSpec aps=new PBEParameterSpec(salt, iterations);
								Cipher keyCipher=null;
								try {
									keyCipher=Cipher.getInstance(pbeAlgorithm);
								}
								catch(NoSuchAlgorithmException e) {
									JOptionPane.showMessageDialog(
										Sig.this,
										"No provider found for "+pbeAlgorithm+".",
										"Secret Key Error",
										JOptionPane.ERROR_MESSAGE
									);
								}
								catch(NoSuchPaddingException e) {}

								if (keyCipher!=null) {
									boolean keyAndAlgorithmAreValid=false;
									try {
										keyCipher.init(Cipher.DECRYPT_MODE, key, aps);
										keyAndAlgorithmAreValid=true;
									}
									catch(InvalidAlgorithmParameterException e) {
										JOptionPane.showMessageDialog(
											Sig.this,
											pbeAlgorithm+" is invalid for cipher.",
											"Cipher Error",
											JOptionPane.ERROR_MESSAGE
										);
									}
									catch(InvalidKeyException e) {
										JOptionPane.showMessageDialog(
											Sig.this,
											"Key is invalid",
											"Key Error",
											JOptionPane.ERROR_MESSAGE
										);
									}

									if (keyAndAlgorithmAreValid) {
										byte[] output=new byte[0];
										boolean outputGotten=true;
										try {
											output=keyCipher.doFinal(input);
										}
										catch(Exception e) {
											outputGotten=false;
											JOptionPane.showMessageDialog(
												Sig.this,
												"Wrong key!",
												"Key Error",
												JOptionPane.ERROR_MESSAGE
											);
										}

										if (outputGotten) {
											// use pbeKey to decrypt private key
										}
									}
								}
							}
						}
					}
				}
				else {
					ObjectInputStream keyIn=null;
					try {
						keyIn=new ObjectInputStream(
							new FileInputStream(keyFile)
						);
					}
					catch(IOException e) {}

					try {
						if (keyAlgorithm.equals("RSA"))
							key=(RSAPrivateKey) keyIn.readObject();
						else
							key=(DSAPrivateKey) keyIn.readObject();
					}
					catch(Exception e) {
						JOptionPane.showMessageDialog(
							Sig.this,
							"Not a "+keyAlgorithm+" private key",
							"Read error",
							JOptionPane.ERROR_MESSAGE
						);
					}
				}

				if (key!=null) {
					boolean keyIsValid=true;
					try {
						sig.initSign(key);
					}
					catch(InvalidKeyException e) {
						keyIsValid=false;
						JOptionPane.showMessageDialog(
							Sig.this,
							"Key is invalid for "+instance+".",
							"Cipher Error",
							JOptionPane.ERROR_MESSAGE
						);
					}

					if (keyIsValid) {
						// store private key directory
						String newPrivateDir=keyFile.getParent();
						PrintStream dirPS=AIO.create("dir.dat");

						if (dirPS!=null) {
							dirPS.println(newPrivateDir);
							dirPS.println(defaultFileDir);
							dirPS.println(defaultSigDir);
							dirPS.println(defaultPublicDir);
							dirPS.flush();
							dirPS.close();
						}

						// open file to sign
						fc=new JFileChooser(defaultFileDir);
						fc.setDialogTitle("Open File to Sign");
						int valOpen=fc.showOpenDialog(Sig.this);
						if (valOpen==JFileChooser.APPROVE_OPTION) {
							File file=fc.getSelectedFile();

							BufferedInputStream fileIn=null;
							try {
								fileIn=new BufferedInputStream(
									new FileInputStream(file)
								);
							}
							catch(IOException e) {}

							if (fileIn!=null) {
								// store file directory
								String newFileDir=file.getParent();
								dirPS=AIO.create("dir.dat");

								if (dirPS!=null) {
									dirPS.println(newPrivateDir);
									dirPS.println(newFileDir);
									dirPS.println(defaultSigDir);
									dirPS.println(defaultPublicDir);
									dirPS.flush();
									dirPS.close();
								}

								// calculate signature
								byte[] buffer=new byte[4096];
								int len;
								while (isAvailable(fileIn)) {
									len=getData(fileIn, buffer);
									try {
										sig.update(buffer, 0, len);
									}
									catch(SignatureException e) {}
								}

								try {
									if (fileIn!=null)
										fileIn.close();
								}
								catch(IOException e) {}

								// save signature
								fc=new JFileChooser(defaultSigDir);
								fc.setDialogTitle("Save Signature");
								fc.setFileFilter(new SignatureFilter());
								int valSig=fc.showSaveDialog(Sig.this);
								if (valSig==fc.APPROVE_OPTION) {
									File sigFile=fc.getSelectedFile();

									FileOutputStream sigOut=null;
									if (getExtension(sigFile).equals(".sig")) {
										try {
											sigOut=new FileOutputStream(sigFile);
										}
										catch(Exception e) {}
									}
									else {
										try {
											sigOut=new FileOutputStream(sigFile.getPath()+".sig");
										}
										catch(Exception e) {}
									}

									if (sigOut!=null) {
										// store signature directory
										String newSigDir=sigFile.getParent();
										dirPS=AIO.create("dir.dat");;

										if (dirPS!=null) {
											dirPS.println(newPrivateDir);
											dirPS.println(newFileDir);
											dirPS.println(newSigDir);
											dirPS.println(defaultPublicDir);
											dirPS.flush();
											dirPS.close();
										}

										// write signature
										byte[] actualSig=new byte[0];
										try {
											actualSig=sig.sign();
										}
										catch(SignatureException e) {}

										try {
											sigOut.write(actualSig);
										}
										catch(IOException e) {}
										try {
											if (sigOut!=null)
												sigOut.close();
										}
										catch(IOException e) {}
									}
								}
							}
						}
					}
				}
			}
		}
	}

	public void verify(String keyAlgorithm, String mdAlgorithm) {
		Signature sig=null;
		String instance="";
		boolean useCryptix=false;
		if (
			keyAlgorithm.equals("ElGamal")||
			mdAlgorithm.equals("MD2")
		) {
			instance=mdAlgorithm+"/"+keyAlgorithm+"/PKCS#1";
			useCryptix=true;
		}
		else
			instance=mdAlgorithm+"with"+keyAlgorithm;
		try {
			if (useCryptix)
				sig=Signature.getInstance(instance, "Cryptix");
			else
				sig=Signature.getInstance(instance);
		}
		catch(NoSuchProviderException e) {}
		catch(NoSuchAlgorithmException e) {
			JOptionPane.showMessageDialog(
				Sig.this,
				"No provider found for "+mdAlgorithm+"with"+keyAlgorithm+".",
				"Provider error",
				JOptionPane.ERROR_MESSAGE
			);
		}

		if (sig!=null) {
			// get default directories
			String defaultPrivateDir="", defaultFileDir="", defaultSigDir="", defaultPublicDir="";
			BufferedReader dirBR=AIO.open("dir.dat");
			boolean defaultDirsFound= (dirBR!=null);

			if (defaultDirsFound) {
				defaultPrivateDir=AIO.read(dirBR);
				defaultFileDir=AIO.read(dirBR);
				defaultSigDir=AIO.read(dirBR);
				defaultPublicDir=AIO.read(dirBR);
			}

			try {
				if (dirBR!=null)
					dirBR.close();
			}
			catch(IOException e) {}

			// open signature
			JFileChooser fc=new JFileChooser(defaultSigDir);
			fc.setDialogTitle("Open Signature");
			fc.setFileFilter(new SignatureFilter());
			int valKeyOpen=fc.showOpenDialog(Sig.this);
			if (valKeyOpen==JFileChooser.APPROVE_OPTION) {
				File sigFile=fc.getSelectedFile();

				// read signature
				FileInputStream sigIn=null;
				try {
					sigIn=new FileInputStream(sigFile);
				}
				catch(IOException e) {}

				int actualSigLen=0;
				try {
					actualSigLen=sigIn.available();
				}
				catch(IOException e) {}

				byte[] actualSig=new byte[actualSigLen];
				try {
					sigIn.read(actualSig);
				}
				catch(IOException e) {
					JOptionPane.showMessageDialog(
						Sig.this,
						"Not a signature",
						"Read error",
						JOptionPane.ERROR_MESSAGE
					);
				}

				try {
					if (sigIn!=null)
						sigIn.close();
				}
				catch(IOException e) {}

				String newSigDir=sigFile.getParent();
				PrintStream dirPS=AIO.create("dir.dat");

				if (dirPS!=null) {
					dirPS.println(defaultPrivateDir);
					dirPS.println(defaultFileDir);
					dirPS.println(newSigDir);
					dirPS.println(defaultPublicDir);
					dirPS.flush();
					dirPS.close();
				}

				// open public key
				fc=new JFileChooser(defaultPublicDir);
				fc.setDialogTitle("Open Public Key");
				fc.setFileFilter(new PublicKeyFilter());
				int valPub=fc.showOpenDialog(Sig.this);
				if (valPub==JFileChooser.APPROVE_OPTION) {
					File keyFile=fc.getSelectedFile();

					ObjectInputStream keyIn=null;
					try {
						keyIn=new ObjectInputStream(
							new FileInputStream(keyFile)
						);
					}
					catch(IOException e) {}

					if (keyIn!=null) {
						// read public key
						PublicKey key=null;
						boolean keyIsValid=true;

						try {
							if (keyAlgorithm.equals("RSA"))
								key=(RSAPublicKey) keyIn.readObject();
							else
								key=(DSAPublicKey) keyIn.readObject();
						}
						catch(Exception e) {
							keyIsValid=false;
							JOptionPane.showMessageDialog(
								Sig.this,
								"Not a "+keyAlgorithm+" key",
								"Read error",
								JOptionPane.ERROR_MESSAGE
							);
						}

						if (keyIsValid) {
							boolean sigInited=true;
							try {
								sig.initVerify(key);
							}
							catch(InvalidKeyException e) {
								sigInited=false;
								JOptionPane.showMessageDialog(
									Sig.this,
									"Key is invalid for "+instance+".",
									"Signature Error",
									JOptionPane.ERROR_MESSAGE
								);
							}

							if (sigInited) {
								// store public key directory
								String newPublicDir=keyFile.getParent();
								dirPS=AIO.create("dir.dat");

								if (dirPS!=null) {
									dirPS.println(defaultPrivateDir);
									dirPS.println(defaultFileDir);
									dirPS.println(newSigDir);
									dirPS.println(newPublicDir);
									dirPS.flush();
									dirPS.close();
								}

								// open file to verify
								fc=new JFileChooser(defaultFileDir);
								fc.setDialogTitle("Open File to Verify");
								int valOpen=fc.showOpenDialog(Sig.this);
								if (valOpen==JFileChooser.APPROVE_OPTION) {
									File file=fc.getSelectedFile();

									BufferedInputStream fileIn=null;
									try {
										fileIn=new BufferedInputStream(
											new FileInputStream(file)
										);
									}
									catch(IOException e) {}

									if (fileIn!=null) {
										// store file directory
										String newFileDir=file.getParent();
										dirPS=AIO.create("dir.dat");

										if (dirPS!=null) {
											dirPS.println(defaultPrivateDir);
											dirPS.println(newFileDir);
											dirPS.println(newSigDir);
											dirPS.println(newPublicDir);
											dirPS.flush();
											dirPS.close();
										}

										// verify signature
										byte[] buffer=new byte[1024];
										int len;
										while (isAvailable(fileIn)) {
											len=getData(fileIn, buffer);
											try {
												sig.update(buffer, 0, len);
											}
											catch(SignatureException e) {}
										}

										try {
											if (fileIn!=null)
												fileIn.close();
										}
										catch(IOException e) {}

										try {
											verifyField.setText(""+sig.verify(actualSig));
										}
										catch(SignatureException e) {}
									}
								}
							}
						}
					}
				}
			}
		}
	}

	public String getExtension(File f) {
		String s=f.getName();
		int i=s.lastIndexOf('.');
		if (i>0 && i<s.length()-1)
			return s.substring(i+1).toLowerCase();
		return "";
	}

	public boolean isAvailable(BufferedInputStream bis) {
		try {
			return bis.available()!=0;
		}
		catch(IOException e) {
			return false;
		}
	}

	public boolean isAvailable(FileInputStream fis) {
		try {
			return fis.available()!=0;
		}
		catch(IOException e) {
			return false;
		}
	}

	public int getData(BufferedInputStream bis, byte[] buffer) {
		try {
			return bis.read(buffer);
		}
		catch(IOException e) {
			return -1;
		}
	}

	public static void main(String args[]) {
		JFrame.setDefaultLookAndFeelDecorated(true);
		JDialog.setDefaultLookAndFeelDecorated(true);

		JFrame frame=new JFrame("Sig");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setResizable(false);

		JComponent newContentPane=new Sig();
		newContentPane.setOpaque(true);
		frame.setContentPane(newContentPane);

		frame.getRootPane().setDefaultButton(signButton);

		frame.pack();
		frame.setVisible(true);
	}
}