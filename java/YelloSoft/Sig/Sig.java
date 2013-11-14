// Sig
// Andrew Pennebaker
// June 14, 2004 - november 30, 2004

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

    String[] keyAlgorithms = {
      "RSA",
      "DSA",
      "ElGamal"
    };

    keyBox = new JComboBox(keyAlgorithms);
    keyBox.setSelectedIndex(0);
    keyBox.addActionListener(this);

    String[] mdAlgorithms = {
      "SHA1",
      "MD5",
      "MD2"
    };

    mdBox = new JComboBox(mdAlgorithms);
    mdBox.setSelectedIndex(0);

    JPanel keyBoxPanel = new JPanel();
    keyBoxPanel.setLayout(new BoxLayout(keyBoxPanel, BoxLayout.PAGE_AXIS));
    keyBoxPanel.setBorder(
      BorderFactory.createCompoundBorder(
        BorderFactory.createTitledBorder("Key"),
        BorderFactory.createEmptyBorder(5, 5, 5, 5)
      )
    );
    keyBoxPanel.add(keyBox);

    JPanel mdBoxPanel = new JPanel();
    mdBoxPanel.setLayout(new BoxLayout(mdBoxPanel, BoxLayout.PAGE_AXIS));
    mdBoxPanel.setBorder(
      BorderFactory.createCompoundBorder(
        BorderFactory.createTitledBorder("Digest"),
        BorderFactory.createEmptyBorder(5, 5, 5, 5)
      )
    );
    mdBoxPanel.add(mdBox);

    JPanel sigPanel = new JPanel();
    sigPanel.setLayout(new BorderLayout());
    sigPanel.add(keyBoxPanel, BorderLayout.WEST);
    sigPanel.add(mdBoxPanel, BorderLayout.EAST);

    passphraseButton = new JCheckBox("Key has passphrase");
    passphraseButton.setMnemonic('p'); // ALT+p
    passphraseButton.setSelected(true);

    JPanel passphrasePanel = new JPanel();
    passphrasePanel.setBorder(
      BorderFactory.createEmptyBorder(5, 5, 5, 5)
    );
    passphrasePanel.setLayout(new BorderLayout());
    passphrasePanel.add(passphraseButton, BorderLayout.WEST);

    JPanel optPanel = new JPanel();
    optPanel.setLayout(new BorderLayout());
    optPanel.add(sigPanel, BorderLayout.NORTH);
    optPanel.add(passphrasePanel, BorderLayout.SOUTH);

    verifyField = new JTextField(12);
    verifyField.setToolTipText(
      "<html>Verification:<br>" +
      "true = file was signed by a key's owner<br>" +
      "false = file was not signed by a key's owner </html>"
    );
    verifyField.setEditable(false);

    JPanel verifyPanel = new JPanel();
    verifyPanel.setBorder(
      BorderFactory.createCompoundBorder(
        BorderFactory.createTitledBorder("Verified"),
        BorderFactory.createEmptyBorder(0, 5, 5, 5)
      )
    );
    verifyPanel.add(verifyField);

    signButton = new JButton("Sign");
    signButton.setMnemonic('s'); // ALT+s
    signButton.addActionListener(this);
    verifyButton = new JButton("Verify");
    verifyButton.setMnemonic('v'); // ALT+v
    verifyButton.addActionListener(this);

    JPanel calcPanel = new JPanel();
    calcPanel.add(signButton);
    calcPanel.add(verifyButton);

    add(optPanel, BorderLayout.PAGE_START);
    add(verifyPanel, BorderLayout.CENTER);
    add(calcPanel, BorderLayout.PAGE_END);
  }

  public final void actionPerformed(final ActionEvent e) {
    if (e.getSource() == keyBox) {
      String keyAlg = (String) keyBox.getSelectedItem();
      if (keyAlg.equals("DSA")) {
        mdBox.setEnabled(false);
        mdBox.setSelectedIndex(0);
      }
      else {
        mdBox.setEnabled(true);
      }
    }
    else if (e.getSource() == signButton) {
      String keyAlg = (String) keyBox.getSelectedItem();
      String mdAlg = (String) mdBox.getSelectedItem();
      boolean hasPass = passphraseButton.isSelected();

      if (keyAlg.equals("ElGamal") && mdAlg.equals("SHA1")) {
        mdAlg = "SHA-1";
      }

      sign(keyAlg, mdAlg, hasPass);
    }
    else if (e.getSource() == verifyButton) {
      String keyAlg = (String) keyBox.getSelectedItem();
      String mdAlg = (String) mdBox.getSelectedItem();

      if (keyAlg.equals("ElGamal") && mdAlg.equals("SHA1")) {
        mdAlg = "SHA-1";
      }

      verify(keyAlg, mdAlg);
    }
  }

  public final void sign(final String keyAlgorithm, final String mdAlgorithm, final boolean hasPassphrase) {
    boolean useCryptix = false;
    String instance = "";

    if (keyAlgorithm.equals("ElGamal")) {
      instance = mdAlgorithm + "/" + keyAlgorithm + "/PKCS#1";
      useCryptix = true;
    }
    else {
      instance = mdAlgorithm + "with" + keyAlgorithm;
    }

    Signature sig = null;

    try {
      if (useCryptix) {
        sig = Signature.getInstance(instance, "Cryptix");
      }
      else {
        sig = Signature.getInstance(instance);
      }
    }
    catch (NoSuchProviderException e) {
      System.out.println("No such provider.");
    }
    catch (NoSuchAlgorithmException e) {
      JOptionPane.showMessageDialog(
        Sig.this,
        "No provider found for " + instance + ".",
        "Provider Error",
        JOptionPane.ERROR_MESSAGE
      );

      return;
    }

    // open private key
    JFileChooser fc = new JFileChooser(".");
    fc.setDialogTitle("Open Private Key");
    fc.setFileFilter(new PrivateKeyFilter());
    int valKeyOpen = fc.showOpenDialog(Sig.this);

    if (valKeyOpen != JFileChooser.APPROVE_OPTION) {
      return;
    }

    File keyFile = fc.getSelectedFile();

    // read private key
    PrivateKey key = null;

    if (hasPassphrase) {
      PassphraseDialog pd = new PassphraseDialog();
      int valInput = pd.showSingleDialog(Sig.this, "Enter passphrase");

      if (valInput != PassphraseDialog.APPROVE_OPTION) {
        return;
      }

      char[] passphrase = pd.getPassphrase();

      String pbeAlgorithm = "PBEwithMD5andDES";

      byte[] salt = new byte[8];
      int iterations = 20;

      PBEKeySpec ks = new PBEKeySpec(passphrase);
      SecretKeyFactory skf;

      try {
        skf = SecretKeyFactory.getInstance(pbeAlgorithm);
      }
      catch (NoSuchAlgorithmException e) {
        JOptionPane.showMessageDialog(
          Sig.this,
          "No provider found for " + pbeAlgorithm + ".",
          "Secret Key Error",
          JOptionPane.ERROR_MESSAGE
        );

        return;
      }

      SecretKey pbeKey;

      try {
        pbeKey = skf.generateSecret(ks);
      }
      catch (InvalidKeySpecException e) {
        System.out.println("Invalid key spec.");
      }

      // read key file
      FileInputStream fileIn = null;

      try {
        fileIn = new FileInputStream(keyFile);
      }
      catch (IOException e) {
        System.out.println("IOException.");
      }

      int len = 0;
      try {
        len = fileIn.available();
      }
      catch (IOException e) {
        System.out.println("IOException.");
      }

      byte[] input = new byte[len - 8];

      try {
        fileIn.read(salt);
        fileIn.read(input);
      }
      catch (IOException e) {
        System.out.println("IOException.");
      }

      // decrypt private key
      PBEParameterSpec aps = new PBEParameterSpec(salt, iterations);
      Cipher keyCipher = null;

      try {
        keyCipher = Cipher.getInstance(pbeAlgorithm);
      }
      catch (NoSuchAlgorithmException e) {
        JOptionPane.showMessageDialog(
          Sig.this,
          "No provider found for " + pbeAlgorithm + ".",
          "Secret Key Error",
          JOptionPane.ERROR_MESSAGE
        );

        return;
      }
      catch (NoSuchPaddingException e) {
        System.out.println("No such padding.");
      }

      try {
        keyCipher.init(Cipher.DECRYPT_MODE, key, aps);
      }
      catch (InvalidAlgorithmParameterException e) {
        JOptionPane.showMessageDialog(
          Sig.this,
          pbeAlgorithm + " is invalid for cipher.",
          "Cipher Error",
          JOptionPane.ERROR_MESSAGE
        );

        return;
      }
      catch (InvalidKeyException e) {
        JOptionPane.showMessageDialog(
          Sig.this,
          "Key is invalid",
          "Key Error",
          JOptionPane.ERROR_MESSAGE
        );

        return;
      }

      byte[] output = new byte[0];

      try {
        output = keyCipher.doFinal(input);
      }
      catch (Exception e) {
        JOptionPane.showMessageDialog(
          Sig.this,
          "Wrong key!",
          "Key Error",
          JOptionPane.ERROR_MESSAGE
        );

        return;
      }

      // use pbeKey to decrypt private key
    }
    else {
      ObjectInputStream keyIn = null;

      try {
        keyIn = new ObjectInputStream(
          new FileInputStream(keyFile)
        );
      }
      catch (IOException e) {
        System.out.println("IOException.");
      }

      try {
        /*if (keyAlgorithm.equals("RSA"))
          key = (RSAPrivateKey) keyIn.readObject();
          else if (keyAlgorithm.equals("ElGamal"))
          key = (ElGamalPrivateKey) keyIn.readObject();
          else
          key = (DSAPrivateKey) keyIn.readObject();*/
        key = (PrivateKey) keyIn.readObject();
      }
      catch (Exception e) {
        JOptionPane.showMessageDialog(
          Sig.this,
          "Not a private key"/*"Not a " + keyAlgorithm + " private key"*/,
          "Read error",
          JOptionPane.ERROR_MESSAGE
        );

        return;
      }
    }

    try {
      sig.initSign(key);
    }
    catch (InvalidKeyException e) {
      JOptionPane.showMessageDialog(
        Sig.this,
        "Key is invalid for " + instance + ".",
        "Signature Error",
        JOptionPane.ERROR_MESSAGE
      );

      return;
    }

    // open file to sign
    fc = new JFileChooser(".");
    fc.setDialogTitle("Open File to Sign");
    int valOpen = fc.showOpenDialog(Sig.this);

    if (valOpen != JFileChooser.APPROVE_OPTION) {
      return;
    }

    File file = fc.getSelectedFile();

    BufferedInputStream fileIn = null;

    try {
      fileIn = new BufferedInputStream(
        new FileInputStream(file)
      );
    }
    catch (IOException e) {
      System.out.println("IOException.");
    }

    // calculate signature
    try {
      sig.update(getAllData(fileIn));
    }
    catch (SignatureException e) {
      System.out.println("Signature exception.");
    }

    try {
      if (fileIn != null) {
        fileIn.close();
      }
    }
    catch (IOException e) {
      System.out.println("IOException.");
    }

    // save signature
    fc = new JFileChooser(".");
    fc.setDialogTitle("Save Signature");
    fc.setFileFilter(new SignatureFilter());
    int valSig = fc.showSaveDialog(Sig.this);

    if (valSig != fc.APPROVE_OPTION) {
      return;
    }

    File sigFile = fc.getSelectedFile();

    FileOutputStream sigOut = null;

    if (getExtension(sigFile).equals(".sig")) {
      try {
        sigOut = new FileOutputStream(sigFile);
      }
      catch (IOException e) {
        System.out.println("IOException.");
      }
    }
    else {
      try {
        sigOut = new FileOutputStream(sigFile.getPath() + ".sig");
      }
      catch (IOException e) {
        System.out.println("IOException.");
      }
    }

    // write signature
    byte[] actualSig = new byte[0];

    try {
      actualSig = sig.sign();
    }
    catch (SignatureException e) {
      System.out.println("Signature exception.");
    }

    try {
      sigOut.write(actualSig);
    }
    catch (IOException e) {
      System.out.println("IOException.");
    }

    try {
      if (sigOut != null) {
        sigOut.close();
      }
    }
    catch (IOException e) {
      System.out.println("IOException.");
    }
  }

  public final void verify(final String keyAlgorithm, final String mdAlgorithm) {
    boolean useCryptix = false;
    String instance = "";

    if (keyAlgorithm.equals("ElGamal")) {
      instance = mdAlgorithm + "/" + keyAlgorithm + "/PKCS#1";
      useCryptix = true;
    }
    else {
      instance = mdAlgorithm + "with" + keyAlgorithm;
    }

    Signature sig = null;

    try {
      if (useCryptix) {
        sig = Signature.getInstance(instance, "Cryptix");
      }
      else {
        sig = Signature.getInstance(instance);
      }
    }
    catch (NoSuchProviderException e) {
      System.out.println("No such provider.");
    }
    catch (NoSuchAlgorithmException e) {
      JOptionPane.showMessageDialog(
        Sig.this,
        "No provider found for " + instance + ".",
        "Provider error",
        JOptionPane.ERROR_MESSAGE
      );

      return;
    }

    // open signature
    JFileChooser fc = new JFileChooser(".");
    fc.setDialogTitle("Open Signature");
    fc.setFileFilter(new SignatureFilter());
    int valKeyOpen = fc.showOpenDialog(Sig.this);

    if (valKeyOpen != JFileChooser.APPROVE_OPTION) {
      return;
    }

    File sigFile = fc.getSelectedFile();

    // read signature
    FileInputStream sigIn = null;

    try {
      sigIn = new FileInputStream(sigFile);
    }
    catch (IOException e) {
      System.out.println("IOException.");
    }

    int actualSigLen = 0;

    try {
      actualSigLen = sigIn.available();
    }
    catch (IOException e) {
      System.out.println("IOException.");
    }

    byte[] actualSig = new byte[actualSigLen];

    try {
      sigIn.read(actualSig);
    }
    catch (IOException e) {
      JOptionPane.showMessageDialog(
        Sig.this,
        "Not a signature",
        "Read error",
        JOptionPane.ERROR_MESSAGE
      );
    }

    try {
      if (sigIn != null) {
        sigIn.close();
      }
    }
    catch (IOException e) {
      System.out.println("IOException.");
    }

    // open public key
    fc = new JFileChooser(".");
    fc.setDialogTitle("Open Public Key");
    fc.setFileFilter(new PublicKeyFilter());
    int valPub = fc.showOpenDialog(Sig.this);

    if (valPub != JFileChooser.APPROVE_OPTION) {
      return;
    }

    File keyFile = fc.getSelectedFile();

    ObjectInputStream keyIn = null;

    try {
      keyIn = new ObjectInputStream(
        new FileInputStream(keyFile)
      );
    }
    catch (IOException e) {
      System.out.println("IOException.");
    }

    // read public key
    PublicKey key = null;

    try {
      /*if (keyAlgorithm.equals("RSA"))
        key = (RSAPublicKey) keyIn.readObject();
        else if (keyAlgorithm.equals("ElGamal"))
        key = (ElGamalPublicKey) keyIn.readObject();
        else
        key = (DSAPublicKey) keyIn.readObject();*/
      key = (PublicKey) keyIn.readObject();
    }
    catch (Exception e) {
      JOptionPane.showMessageDialog(
        Sig.this,
        "Not a public key"/* + "Not a " + keyAlgorithm + " key"*/,
        "Read error",
        JOptionPane.ERROR_MESSAGE
      );

      return;
    }

    try {
      sig.initVerify(key);
    }
    catch (InvalidKeyException e) {
      JOptionPane.showMessageDialog(
        Sig.this,
        "Key is invalid for " + instance + ".",
        "Signature Error",
        JOptionPane.ERROR_MESSAGE
      );

      return;
    }

    // open file to verify
    fc = new JFileChooser(".");
    fc.setDialogTitle("Open File to Verify");
    int valOpen = fc.showOpenDialog(Sig.this);

    if (valOpen != JFileChooser.APPROVE_OPTION) {
      return;
    }

    File file = fc.getSelectedFile();

    BufferedInputStream fileIn = null;

    try {
      fileIn = new BufferedInputStream(
        new FileInputStream(file)
      );
    }
    catch (IOException e) {
      System.out.println("IOException.");
    }

    // verify signature
    try {
      sig.update(getAllData(fileIn));
    }
    catch (SignatureException e) {
      System.out.println("Signature exception.");
    }

    try {
      if (fileIn != null) {
        fileIn.close();
      }
    }
    catch (IOException e) {
      System.out.println("IOException.");
    }

    try {
      verifyField.setText("" + sig.verify(actualSig));
    }
    catch (SignatureException e) {
      System.out.println("Signature exception.");
    }
  }

  public final String getExtension(final File f) {
    String s = f.getName();
    int i = s.lastIndexOf('.');

    if (i > 0 && i < s.length() - 1) {
      return s.substring(i + 1).toLowerCase();
    }
    else {
      return "";
    }
  }

  public final boolean isAvailable(final InputStream is) {
    try {
      return is.available() != 0;
    }
    catch (IOException e) {
      return false;
    }
  }

  public static final byte[] getAllData(final InputStream in) {
    byte[] buf;

    try {
      buf = new byte[in.available()];
      int i = in.read(buf);
    }
    catch (IOException e) {
      buf = new byte[0];
    }

    return buf;
  }

  public static void main(final String[] args) {
    JFrame.setDefaultLookAndFeelDecorated(true);
    JDialog.setDefaultLookAndFeelDecorated(true);

    JFrame frame = new JFrame("Sig");
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frame.setResizable(false);
    frame.setContentPane(new Sig());
    frame.getRootPane().setDefaultButton(signButton);

    frame.pack();
    Windows.centerOnScreen(frame);
    frame.show();
  }
}
