package us.yellosoft.filetransfer;

import java.io.*;
import javax.crypto.*;

/** Encryption wrapper around an input stream */
public class EncryptedInputStream extends InputStream {
    private /*Cipher*/BufferedInputStream in;

    /**
    * <p>Wrap an input stream in encryption</p>
    * @param is input stream
    * @param c cipher
    */
    public EncryptedInputStream(final InputStream is, final Cipher c) {
        in = new BufferedInputStream(is);
    }

    /**
    * <p>Read an integer</p>
    * @return an integer
    */
    public final int read() {
        try {
            return in.read();
        } catch (IOException e) {
            e.printStackTrace();
            return -1;
        }
    }

    /**
    * <p>Read a string</p>
    * @return a string
    * @throws Exception on read error
    */
    public final String readString() throws Exception {
        int len = (int) read();

        byte[] buf = new byte[len];
        in.read(buf);

        char[] stringChars = new char[buf.length];

        for (int i = 0; i < stringChars.length; i++) {
            stringChars[i] = (char) buf[i];
        }

        return new String(stringChars);
    }
}
