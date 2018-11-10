package us.yellosoft.filetransfer;

import java.io.*;
import java.net.*;
import java.util.*;
import javax.swing.JOptionPane;

import java.security.*;
import javax.crypto.*;

import sun.misc.*;
import us.yellosoft.dialogs.PassphraseDialog;

/** File transfer client */
public class YFTClient {
    /**
    * <p>Start client</p>
    * @param args CLI args
    * @throws Exception on error
    */
    public static void main(final String[] args) throws Exception {
        String alg = JOptionPane.showInputDialog("Enter session algorithm");
        String host = JOptionPane.showInputDialog("Enter hostname or ip");

        int port = -1;

        while (port == -1) {
            try {
                port = 7000; //Integer.parseInt(JOptionPane.showInputDialog("Enter port"));
            } catch (NumberFormatException e) {
                System.out.println("Number format exception.");
            }
        }

        Socket socket = null;

        try {
            socket = new Socket(host, port);
        } catch (IOException e) {
            System.out.println("Server " + host + " not connected at port " + port + ".");
            System.exit(0);
        }

        DataInputStream in = new DataInputStream(socket.getInputStream());
        DataOutputStream out = new DataOutputStream(socket.getOutputStream());

        ObjectInputStream verifyingKeyIn = new ObjectInputStream(
            new FileInputStream("RSA.session.pk")
        );
        PublicKey verifyingKey = (PublicKey) verifyingKeyIn.readObject();
        verifyingKeyIn.close();

        SecureRandom rand = new SecureRandom();
        int sigRand = rand.nextInt();

        String sigDate = "" + new Date().toString();

        sendString(out, "" + sigRand);
        sendString(out, sigDate);

        String sigEnc = getString(in);

        if (makeVerification(verifyingKey, sigEnc, "YSES" + sigRand + sigDate).equals("true")) {
            System.out.println("-Verified-");

            BASE64Decoder decoder = new BASE64Decoder();
            System.out.println("Signature: " + sigEnc);

            String timeStamp, randomNumber;
            timeStamp = getString(in);
            randomNumber = getString(in);

            String name = JOptionPane.showInputDialog("Name:");

            PassphraseDialog pd = new PassphraseDialog();
            int valPass = pd.showSingleDialog(null, "Enter session passphrase");

            if (valPass == PassphraseDialog.APPROVE_OPTION) {
                char[] pass = pd.getPassphrase();

                // hash login info
                MessageDigest md = MessageDigest.getInstance("MD5");
                md.update(name.getBytes());
                md.update(timeStamp.getBytes());
                md.update(randomNumber.getBytes());
                md.update(new String(pass).getBytes());
                byte[] digestBytes = md.digest();
                BASE64Encoder encoder = new BASE64Encoder();
                System.out.println("Digest: " + encoder.encode(digestBytes));

                sendString(out, name);
                sendString(out, encoder.encode(digestBytes));

                String response = getString(in);

                if (response.equals("true")) {
                    System.out.println("-logged in-");

                    String[] terms = {alg, name};

                    try {
                        yft(terms, socket);
                    } catch (Exception e) {
                        //e.printStackTrace();
                    }
                } else {
                    System.out.println("-login unsuccessful-");
                }
            }

            // close connections
            in.close();
            out.close();
        } else {
            System.out.println("-Server could not verify itself as your YServer-");
        }

        socket.close();

        System.out.println("-Closing-");
        System.exit(1);
    }

    /**
    * <p>Transfer file</p>
    * @param params parameters
    * @param socket network socket
    * @throws Exception on error
    */
    public static void yft(final String[] params, final Socket socket) throws Exception {
        DataInputStream in = new DataInputStream(socket.getInputStream());
        DataOutputStream out = new DataOutputStream(socket.getOutputStream());

        String alg = params[0];
        String name = params[1];

        SecretKey key;

        ObjectInputStream keyIn = new ObjectInputStream(
            new FileInputStream(alg + ".session.ser")
        );

        key = (SecretKey) keyIn.readObject();
        keyIn.close();

        Cipher c1 = Cipher.getInstance(alg + "/ECB/PKCS5Padding");
        Cipher c2 = Cipher.getInstance(alg + "/ECB/PKCS5Padding");
        c1.init(Cipher.ENCRYPT_MODE, key);
        c2.init(Cipher.DECRYPT_MODE, key);

        EncryptedInputStream eis = new EncryptedInputStream(
            socket.getInputStream(),
            c2
        );
        int decryptLen = Integer.parseInt(getString(in));
        System.out.println(makeDecryption(c2, getString(in),
                                                                            decryptLen)/*eis.readString()*/);

        boolean latherRinseRepeat = true;
        boolean shutDown = false;
        boolean serverRan = false;
        String message = JOptionPane.showInputDialog("Command:");

        EncryptedOutputStream eos = new EncryptedOutputStream(
            socket.getOutputStream(),
            c1
        );

        sendString(out, "" + message.getBytes().length);
        sendString(out, makeEncryption(c1, message)); // eos.writeString(message);

        while (latherRinseRepeat && !serverRan) {
            if (message.length() > 5 && message.substring(0, 4).equals("echo")) {
                System.out.println("-awaiting echo-");
                String echoPhrase = "";
                decryptLen = Integer.parseInt(getString(in));
                // try {
                echoPhrase = makeDecryption(c2, getString(in), decryptLen); // eis.readString();
                // }
                // catch (SocketException e) {
                //     echoPhrase = "[server ran]";
                //     serverRan = true;
                // }
                System.out.println("SERVER: " + echoPhrase);
            }

            else if (
                message.length() > 4 &&
                message.substring(0, 3).equals("get") &&
                message.indexOf(' ') != message.lastIndexOf(' ')
            ) {
                String fileToReceive = message.substring(4, message.lastIndexOf(' '));
                String fileToSave = message.substring(message.lastIndexOf(' ') + 1);

                System.out.println("-receiving " + fileToReceive + "-");
                /*PerformingOperationDialog pod = new PerformingOperationDialog();
                    pod.setTitle("YFTClient");
                    pod.setLabelText("Receiving " + fileToReceive + ". Please wait.");
                    pod.setParent(null);*/

                try {

                    /*Thread t = new Thread(
                        pod
                        );*/

                    FileOutputStream fos = new FileOutputStream(fileToSave);

                    Socket fileSocket = new Socket(socket.getInetAddress(), socket.getPort() + 1);
                    CipherInputStream temp = new CipherInputStream(
                        fileSocket.getInputStream(),
                        c2
                    );

                    // decrypt file
                    int d = getData(temp);

                    while (d != -1) {
                        writeData(fos, d);
                        d = getData(temp);
                    }

                    temp.close();
                    fileSocket.close();

                    System.out.println("-" + fileToReceive + " received-");

                    fos.flush();
                    fos.close();

                    System.out.println("-" + fileToSave + " saved-");
                    //pod.hide();
                } catch (Exception e) {
                    e.printStackTrace();
                    System.exit(1);
                }
            } else if (
                message.length() > 5 &&
                message.substring(0, 4).equals("send") &&
                message.indexOf(' ') != message.lastIndexOf(' ')
            ) {
                String fileToSend = message.substring(5, message.lastIndexOf(' '));
                System.out.println("-sending " + fileToSend + "-");

                FileInputStream fis = null;

                try {
                    fis = new FileInputStream(fileToSend);
                } catch (IOException e) {
                    System.out.println("-" + fileToSend + " not found-\n-sending fnf notice-");

                    DataOutputStream dos = new DataOutputStream(
                        new FileOutputStream("temp.dat")
                    );
                    dos.writeUTF("-" + fileToSend + " not found-");
                    dos.close();

                    fis = new FileInputStream("temp.dat");
                }

                //System.out.println("-encrypting " + fileToSend + "-");

                Socket fileSocket = new Socket(socket.getInetAddress(), socket.getPort() + 1);
                CipherOutputStream temp = new CipherOutputStream(
                    fileSocket.getOutputStream(),
                    c1
                );

                System.out.println("--writing " + fileToSend + "--");

                // encrypt file
                int d = getData(fis);

                while (d != -1) {
                    writeData(temp, d);
                    d = getData(fis);
                }

                fis.close();

                temp.flush();
                temp.close();
                fileSocket.close();

                System.out.println("-" + fileToSend + " sent-");
            }

            else if (message.length() == 6 && message.substring(0, 6).equals("logout")) {
                latherRinseRepeat = false;
            } else if (message.length() == 8 && message.substring(0, 8).equals("shutdown")) {
                latherRinseRepeat = false;
                shutDown = true;
            }

            if (latherRinseRepeat) {
                message = JOptionPane.showInputDialog("Command:");
                sendString(out, "" + message.getBytes().length);
                sendString(out, makeEncryption(c1, message)); // eos.writeString(message);
            }
        }

        if (!shutDown && !serverRan) {
            decryptLen = Integer.parseInt(getString(in));
            message = JOptionPane.showInputDialog(makeDecryption(c2, getString(in),
                                                                                        decryptLen)/*eis.readString*/);
            sendString(out, "" + message.getBytes().length);
            sendString(out, makeEncryption(c1, message)); // eos.writeString(message);

            decryptLen = Integer.parseInt(getString(in));
            message = JOptionPane.showInputDialog(makeDecryption(c2, getString(in),
                                                                                        decryptLen)/*eis.readString()*/);
            sendString(out, "" + message.getBytes().length);
            sendString(out, makeEncryption(c1, message)); // eos.writeString(message);

            System.out.println("-disconnected safely-");
        }

        else if (!serverRan) {
            System.out.println("-YServer shutting down " + new Date() + "-");
        } else {
            System.out.println("-ended transmission with disconnected server-");
        }

        eis.close();
        eos.close();
        in.close();
        out.close();
    }

    /**
    * <p>Encrypt</p>
    * @param c a cipher
    * @param plainText plaintext data
    * @return ciphertext, base64 formatted
    */
    public static String makeEncryption(final Cipher c, final String plainText) {
        try {
            BASE64Encoder encoder = new BASE64Encoder();

            byte[] cipherBytes = new byte[0];
            YByteInputStream ybis = new YByteInputStream(plainText.getBytes());
            YByteOutputStream ybos = new YByteOutputStream(cipherBytes);

            // encrypt
            int d = getData(ybis);

            while (d != -1) {
                writeData(ybos, d);
                d = getData(ybis);
            }

            return encoder.encode(ybos.getBytes());
        } catch (Exception e) {
            e.printStackTrace();
            return "[error encrypting]";
        }
    }

    /**
    * <p>Decrypt</p>
    * @param c a cipher
    * @param cipherText ciphertext data
    * @param len length
    * @return plaintext, as a string
    */
    public static String makeDecryption(final Cipher c, final String cipherText,
                                                                            final int len) {
        try {
            BASE64Decoder decoder = new BASE64Decoder();

            byte[] plainBytes = new byte[0];
            byte[] cipherBytes = decoder.decodeBuffer(cipherText);
            YByteInputStream ybis = new YByteInputStream(cipherBytes);
            YByteOutputStream ybos = new YByteOutputStream(plainBytes);

            // decrypt
            int i = 0;
            int d = getData(ybis);

            while (d != -1) {
                writeData(ybos, d);
                d = getData(ybis);
            }

            byte[] temp = ybos.getBytes();
            byte[] finalBytes = new byte[len];

            for (int x = 0; x < len; x++) {
                finalBytes[x] = temp[x];
            }

            return new String(finalBytes);
        } catch (Exception e) {
            e.printStackTrace();
            return "[error decrypting]";
        }
    }

    /**
    * <p>Verify a digital signature</p>
    * @param key public key
    * @param sigData signature
    * @param text plaintext data
    * @return verification or error message
    */
    public static String makeVerification(final PublicKey key, final String sigData,
                                                                                final String text) {
        try {
            BASE64Decoder decoder = new BASE64Decoder();

            Signature aSig = Signature.getInstance("SHA1withRSA");
            aSig.initVerify(key);

            byte[] actualSig = decoder.decodeBuffer(sigData);
            YByteInputStream ybis = new YByteInputStream(text.getBytes());

            // verify signature
            aSig.update(getAllData(ybis));

            return ("" + aSig.verify(actualSig));
        } catch (Exception e) {
            e.printStackTrace();
            return "[error verifying]";
        }
    }

    /**
    * <p>Get a string from a stream</p>
    * @param dis stream
    * @return string
    */
    public static String getString(final DataInputStream dis) {
        try {
            return dis.readUTF();
        } catch (IOException e) {
            return "";
        }
    }

    /**
    * <p>Write a string to a stream</p>
    * @param dos output stream
    * @param s string
    */
    public static void sendString(final DataOutputStream dos, final String s) {
        try {
            dos.writeUTF(s);
            dos.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
    * <p>Decode base64 formatted string</p>
    * @param u base64 formatted string
    * @return data, in bytes
    */
    public final byte[] getDecoded(final String u) {
        BASE64Decoder decoder = new BASE64Decoder();

        try {
            return decoder.decodeBuffer(u);
        } catch (IOException e) {
            e.printStackTrace();

            byte[] temp = {(byte) 0};

            return temp;
        }
    }

    /**
    * <p>Read an integer from a stream</p>
    * @param is input stream
    * @return an integer
    */
    public static int getData(final InputStream is) {
        try {
            int i = is.read();
            return i;
        } catch (IOException e) {
            e.printStackTrace();
        }

        return -1;
    }

    /**
    * <p>Buffer and read all data from a stream</p>
    * @param in input stream
    * @return data, in bytes
    */
    public static byte[] getAllData(final InputStream in) {
        byte[] buf;

        try {
            buf = new byte[in.available()];
            int i = in.read(buf);
        } catch (IOException e) {
            buf = new byte[0];
        }

        return buf;
    }

    /**
    * <p>Write an integer to a stream</p>
    * @param os output stream
    * @param data an integer
    */
    public static void writeData(final OutputStream os, final int data) {
        try {
            os.write(data);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
