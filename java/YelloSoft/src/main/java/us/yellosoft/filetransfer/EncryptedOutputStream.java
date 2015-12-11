package us.yellosoft.filetransfer;

import java.io.*;
import javax.crypto.*;

/** Encryption wrapper around output stream */
public class EncryptedOutputStream extends OutputStream {
  private /*Cipher*/BufferedOutputStream out;

  /**
     <p>Wrap an output stream in encryption</p>
     @param os output stream
     @param c cipher
  */
  public EncryptedOutputStream(final OutputStream os, final Cipher c) {
    out = /*new CipherOutputStream(*/
      new BufferedOutputStream(os)/*,
                                    c
                                    )*/;
  }

  /**
     <p>Write an integer</p>
     @param i an integer
  */
  public final void write(final int i) {
    try {
      out.write(i);
      out.flush();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  /**
     <p>Write a string</p>
     @param s a string
  */
  public final void writeString(final String s) {
    int len = s.length();
    byte[] buf = new byte[len];

    for (int i = 0; i < buf.length; i++) {
      buf[i] = (byte) s.charAt(i);
    }

    try {
      write(len);
      out.write(buf);
      out.flush();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  /** Close stream */
  public final void close() {
    try {
      out.flush();
      out.close();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
}
