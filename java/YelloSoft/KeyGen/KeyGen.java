// KeyGen
// Andrew Pennebaker
// June 12, 2004 - November 30, 2004

import java.io.*;
import java.security.*;
import java.security.spec.*;
import javax.crypto.*;
import javax.crypto.spec.*;

import xjava.security.*;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.filechooser.*;

public class KeyGen extends JPanel implements ActionListener {
  public static final String[] ALGORITHMS = {
    "RSA",
    "ElGamal",
    "DSA",
    "DH",
    "AES",
    "IDEA",
    "Blowfish",
    "CAST5",
    "Loki91",
    "RC5",
    "RC4",
    "RC2",
    "DESede",
    "DES2X",
    "DESX",
    "DES",
    "SAFER",
    "SPEED",
    "Square"
  };

  JList algList;
  JCheckBox passphraseButton;
  static JButton genButton;

  public KeyGen() {
    super(new BorderLayout());

    algList = new JList(ALGORITHMS);
    algList.setSelectedIndex(0);
    algList.setVisibleRowCount(4);

    JScrollPane algScroller = new JScrollPane(algList);
    algScroller.setPreferredSize(new Dimension(100, 75));

    passphraseButton = new JCheckBox("Passphrase-encrypt key");
    passphraseButton.setMnemonic('p'); // ALT+p
    passphraseButton.setToolTipText(
      "<html>If your key were stolen, the new user would<br>" +
      "have to guess your passphrase to use the key</html>"
    );
    passphraseButton.setSelected(true);

    JPanel algPanel = new JPanel();
    algPanel.setLayout(new BorderLayout());
    algPanel.setBorder(
      BorderFactory.createCompoundBorder(
        BorderFactory.createTitledBorder("Key algorithm"),
        BorderFactory.createEmptyBorder(5, 5, 5, 5)
      )
    );
    algPanel.add(algList);

    JPanel pbeKeyPanel = new JPanel();
    pbeKeyPanel.setLayout(new BorderLayout());
    pbeKeyPanel.setBorder(
      BorderFactory.createEmptyBorder(5, 5, 5, 5)
    );
    pbeKeyPanel.add(passphraseButton, BorderLayout.WEST);

    genButton = new JButton("Generate");
    genButton.setMnemonic('g'); // ALT+g
    genButton.addActionListener(this);

    JPanel genPanel = new JPanel();
    genPanel.add(genButton);

    add(algPanel, BorderLayout.PAGE_START);
    add(pbeKeyPanel, BorderLayout.CENTER);
    add(genPanel, BorderLayout.PAGE_END);
  }

  public final void actionPerformed(final ActionEvent e) {
    if (e.getSource() == genButton) {
      String alg = ALGORITHMS[algList.getSelectedIndex()];
      boolean usePass = passphraseButton.isSelected();

      if (
        alg.equals("RSA") ||
        alg.equals("DSA") ||
        alg.equals("DH") ||
        alg.equals("ElGamal")
      ) {
        generateKeyPair(alg, usePass);
      }
      else {
        generateSecretKey(alg, usePass);
      }
    }
  }

  public final void generateKeyPair(final String algorithm, final boolean usePassphrase) {
    KeyPairGenerator kpg = null;
    String provider = "Cryptix";

    try {
      if (algorithm.equals("ElGamal")) {
        kpg = KeyPairGenerator.getInstance(algorithm, provider);
      }
      else {
        kpg = KeyPairGenerator.getInstance(algorithm);
      }
    }
    catch (NoSuchProviderException e) {
      JOptionPane.showMessageDialog(
        KeyGen.this,
        provider + " not installed.",
        "Provider error",
        JOptionPane.ERROR_MESSAGE
      );

      return;
    }
    catch (NoSuchAlgorithmException e) {
      JOptionPane.showMessageDialog(
        KeyGen.this,
        "No provider found for " + algorithm + ".",
        "Provider error",
        JOptionPane.ERROR_MESSAGE
      );

      return;
    }

    String[] sizes = { "512", "1024", "2048" };
    KeyLengthDialog kld = new KeyLengthDialog(sizes, 1, KeyLengthDialog.CUSTOM);
    kld.setMultiple(128);
    kld.setBounds(512, 2048);
    int valSpec = kld.showDialog(KeyGen.this, "Set Key Spec");

    if (valSpec != KeyLengthDialog.APPROVE_OPTION) {
      return;
    }

    int bits = Integer.parseInt((String) kld.getChoice());

    kpg.initialize(bits, new SecureRandom());

    KeyPair pair = kpg.generateKeyPair();

    // save public key
    JFileChooser fc = new JFileChooser(".");
    fc.setDialogTitle("Save Public Key");
    fc.setFileFilter(new PublicKeyFilter());
    int valPub = fc.showSaveDialog(KeyGen.this);

    if (valPub != JFileChooser.APPROVE_OPTION) {
      return;
    }

    File publicKeyFile = fc.getSelectedFile();

    ObjectOutputStream publicKeyOut = null;
    try {
      if (getExtension(publicKeyFile).equals(".pk")) {
        publicKeyOut = new ObjectOutputStream(
          new FileOutputStream(publicKeyFile)
        );
      }
      else {
        publicKeyOut = new ObjectOutputStream(
          new FileOutputStream(publicKeyFile.getPath() + ".pk")
        );
      }
    }
    catch (IOException e) {
      System.out.println("IOException.");
    }

    // save private key
    fc = new JFileChooser(".");
    fc.setDialogTitle("Save Private Key");
    fc.setFileFilter(new PrivateKeyFilter());
    int valPri = fc.showSaveDialog(KeyGen.this);

    if (valPri != fc.APPROVE_OPTION) {
      return;
    }

    File privateKeyFile = fc.getSelectedFile();

    ObjectOutputStream privateKeyOut = null;
    try {
      if (getExtension(privateKeyFile).equals("sk")) {
        privateKeyOut = new ObjectOutputStream(
          new FileOutputStream(privateKeyFile)
        );
      }
      else {
        privateKeyOut = new ObjectOutputStream(
          new FileOutputStream(privateKeyFile.getPath() + ".sk")
        );
      }
    }
    catch (IOException e) {
      System.out.println("IOException.");
    }

    if (usePassphrase) {
      PassphraseDialog pd = new PassphraseDialog();
      int valPass = pd.showConfirmDialog(KeyGen.this, "Enter passphrase");

      if (valPass != PassphraseDialog.APPROVE_OPTION) {
        return;
      }

      char[] passphrase = pd.getPassphrase();

      String keyAlgorithm = "PBEwithMD5andDES";

      byte[] salt = new byte[8];
      int iterations = 20;

      PBEKeySpec ks = new PBEKeySpec(passphrase);
      SecretKeyFactory skf = null;
      try {
        skf = SecretKeyFactory.getInstance(keyAlgorithm);
      }
      catch (NoSuchAlgorithmException e) {
        JOptionPane.showMessageDialog(
          KeyGen.this,
          "No provider found for " + keyAlgorithm + ".",
          "Secret Key Error",
          JOptionPane.ERROR_MESSAGE
        );

        return;
      }

      SecretKey pbeKey = null;

      try {
        pbeKey = skf.generateSecret(ks);
      }
      catch (InvalidKeySpecException e) {
        System.out.println("Invalid key spec.");
      }

      byte[] priKeyBytes = pair.getPrivate().getEncoded();
      MessageDigest md = null;

      try {
        md = MessageDigest.getInstance("MD5");
      }
      catch (NoSuchAlgorithmException e) {
        System.out.println("No such algorithm.");
      }

      md.update(new String(passphrase).getBytes());
      md.update(priKeyBytes);

      byte[] digest = md.digest();
      System.arraycopy(digest, 0, salt, 0, 8);

      // encrypt key
      PBEParameterSpec aps = new PBEParameterSpec(salt, iterations);
      Cipher cipher = null;

      try {
        cipher = Cipher.getInstance(keyAlgorithm);
      }
      catch (NoSuchAlgorithmException e) {
        JOptionPane.showMessageDialog(
          KeyGen.this,
          keyAlgorithm + " is invalid for cipher.",
          "Cipher Error",
          JOptionPane.ERROR_MESSAGE
        );

        return;
      }
      catch (NoSuchPaddingException e) {
        System.out.println("No such algorithm.");
      }

      try {
        cipher.init(Cipher.ENCRYPT_MODE, pbeKey, aps);
      }
      catch (InvalidAlgorithmParameterException e) {
        JOptionPane.showMessageDialog(
          KeyGen.this,
          keyAlgorithm + " is invalid for cipher.",
          "Cipher Error",
          JOptionPane.ERROR_MESSAGE
        );

        return;
      }
      catch (InvalidKeyException e) {
        JOptionPane.showMessageDialog(
          KeyGen.this,
          "Key is invalid for " + keyAlgorithm + ".",
          "Cipher Error",
          JOptionPane.ERROR_MESSAGE
        );

        return;
      }

      byte[] output = getPBEOutput(cipher, priKeyBytes);

      // write encrypted private key
      try {
        privateKeyOut.write(salt);
        privateKeyOut.write(output);
        privateKeyOut.close();
      }
      catch (IOException e) {
        System.out.println("IOException.");
      }
    }
    else {
      try {
        privateKeyOut.writeObject(pair.getPrivate()/*.getEncoded()*/);
        privateKeyOut.close();
      }
      catch (IOException e) {
        System.out.println("IOException.");
      }
    }
  }

  public final void generateSecretKey(final String algorithm, final boolean usePassphrase) {
    KeyGenerator kg = null;
    String provider = "Cryptix";

    try {
      if (
        !algorithm.equals("AES") &&
        !algorithm.equals("Blowfish") &&
        !algorithm.equals("DESede") &&
        !algorithm.equals("DES")
      ) {
        kg = KeyGenerator.getInstance(algorithm, provider);
      }
      else {
        kg = KeyGenerator.getInstance(algorithm);
      }
    }
    catch (NoSuchProviderException e) {
      JOptionPane.showMessageDialog(
        KeyGen.this,
        provider + " not installed.",
        "Provider error",
        JOptionPane.ERROR_MESSAGE
      );

      return;
    }
    catch (NoSuchAlgorithmException e) {
      JOptionPane.showMessageDialog(
        KeyGen.this,
        "No provider found for " + algorithm + ".",
        "Provider error",
        JOptionPane.ERROR_MESSAGE
      );

      return;
    }

    // default is DES
    String[] sizes = new String[2];
    sizes[0] = "56";
    sizes[1] = "40";

    if (algorithm.equals("Blowfish")) {
      sizes = new String[3];
      sizes[0] = "448";
      sizes[1] = "56";
      sizes[2] = "32";
    }
    else if (algorithm.equals("AES")) {
      sizes = new String[3];
      sizes[0] = "256";
      sizes[1] = "192";
      sizes[2] = "128";
    }
    else if (algorithm.equals("DESede")) {
      sizes = new String[2];
      sizes[0] = "168";
      sizes[1] = "112";
    }

    KeyLengthDialog kld = null;
    int valSpec = 0;

    if (
      !algorithm.equals("IDEA") &&
      !algorithm.equals("Loki91")
    ) {
      boolean isCustom = algorithm.equals("Blowfish");

      kld = new KeyLengthDialog(sizes, sizes.length - 1, isCustom);

      if (isCustom) {
        kld.setMultiple(8);
        kld.setBounds(32, 448);
      }

      valSpec = kld.showDialog(KeyGen.this, "Set Key Length");
    }

    if (
      !algorithm.equals("IDEA") &&
      !algorithm.equals("Loki91") &&
      valSpec != KeyLengthDialog.APPROVE_OPTION
    ) {
      return;
    }

    int bits;

    if (
      !algorithm.equals("IDEA") &&
      !algorithm.equals("Loki91")
    ) {
      bits = Integer.parseInt((String) kld.getChoice());
      kg.init(bits, new SecureRandom());
    }

    SecretKey key = kg.generateKey();

    // save secret key
    JFileChooser fc = new JFileChooser(".");
    fc.setDialogTitle("Save Secret Key");
    fc.setFileFilter(new SecretKeyFilter());
    int val = fc.showSaveDialog(KeyGen.this);

    if (val != JFileChooser.APPROVE_OPTION) {
      return;
    }

    File keyFile = fc.getSelectedFile();

    ObjectOutputStream keyOut = null;
    try {
      if (getExtension(keyFile).equals("ser")) {
        keyOut = new ObjectOutputStream(
          new FileOutputStream(keyFile)
        );
      }
      else {
        keyOut = new ObjectOutputStream(
          new FileOutputStream(keyFile.getPath() + ".ser")
        );
      }
    }
    catch (IOException e) {
      System.out.println("IOException.");
    }

    if (usePassphrase) {
      PassphraseDialog pd = new PassphraseDialog();
      int valPass = pd.showConfirmDialog(KeyGen.this, "Enter passphrase");

      if (valPass != PassphraseDialog.APPROVE_OPTION) {
        return;
      }

      char[] passphrase = pd.getPassphrase();

      String keyAlgorithm = "PBEwithMD5andDES";

      byte[] salt = new byte[8];
      int iterations = 20;

      PBEKeySpec ks = new PBEKeySpec(passphrase);
      SecretKeyFactory skf = null;

      try {
        skf = SecretKeyFactory.getInstance(keyAlgorithm);
      }
      catch (NoSuchAlgorithmException e) {
        JOptionPane.showMessageDialog(
          KeyGen.this,
          "No provider found for " + keyAlgorithm + ".",
          "Secret Key Error",
          JOptionPane.ERROR_MESSAGE
        );

        return;
      }

      SecretKey pbeKey = null;

      try {
        pbeKey = skf.generateSecret(ks);
      }
      catch (InvalidKeySpecException e) {
        System.out.println("Invalid key spec.");
      }

      byte[] secKeyBytes = key.getEncoded();
      MessageDigest md = null;

      try {
        md = MessageDigest.getInstance("MD5");
      }
      catch (NoSuchAlgorithmException e) {
        System.out.println("No such algorithm.");
      }

      md.update(new String(passphrase).getBytes());
      md.update(secKeyBytes);

      byte[] digest = md.digest();
      System.arraycopy(digest, 0, salt, 0, 8);

      // encrypt key
      PBEParameterSpec aps = new PBEParameterSpec(salt, iterations);
      Cipher cipher = null;

      try {
        cipher = Cipher.getInstance(keyAlgorithm);
      }
      catch (NoSuchAlgorithmException e) {
        JOptionPane.showMessageDialog(
          KeyGen.this,
          keyAlgorithm + " is invalid for cipher.",
          "Cipher Error",
          JOptionPane.ERROR_MESSAGE
        );

        return;
      }
      catch (NoSuchPaddingException e) {
        System.out.println("No such padding.");
      }

      try {
        cipher.init(Cipher.ENCRYPT_MODE, pbeKey, aps);
      }
      catch (InvalidAlgorithmParameterException e) {
        JOptionPane.showMessageDialog(
          KeyGen.this,
          keyAlgorithm + " is invalid for cipher.",
          "Cipher Error",
          JOptionPane.ERROR_MESSAGE
        );

        return;
      }
      catch (InvalidKeyException e) {
        JOptionPane.showMessageDialog(
          KeyGen.this,
          "Key is invalid for " + keyAlgorithm + ".",
          "Cipher Error",
          JOptionPane.ERROR_MESSAGE
        );

        return;
      }

      byte[] output = getPBEOutput(cipher, secKeyBytes);

      // write encrypted secret key
      try {
        keyOut.write(salt);
        keyOut.write(output);
        keyOut.close();
      }
      catch (IOException e) {
        System.out.println("IOException.");
      }
    }
    else {
      try {
        //keyOut.writeObject(key);
        keyOut.writeObject(key/*.getEncoded()*/);
        keyOut.close();
      }
      catch (IOException e) {
        System.out.println("IOException.");
      }
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

  public final byte[] getPBEOutput(final Cipher c, final byte[] input) {
    try {
      return c.doFinal(input);
    }
    catch (Exception e) {
      return null;
    }
  }

  public static void main(final String[] args) {
    JFrame.setDefaultLookAndFeelDecorated(true);
    JDialog.setDefaultLookAndFeelDecorated(true);

    JFrame frame = new JFrame("KeyGen");
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frame.setResizable(false);
    frame.setContentPane(new KeyGen());
    frame.getRootPane().setDefaultButton(genButton);

    frame.pack();
    Windows.centerOnScreen(frame);
    frame.show();
  }
}
