// EncryptedOutputStream
// Andrew Pennebaker
// July 13, 2004

import java.io.*;
import javax.crypto.*;

public class EncryptedOutputStream extends OutputStream {
  private /*Cipher*/BufferedOutputStream out;

  public EncryptedOutputStream(OutputStream os, Cipher c) {
    out=/*new CipherOutputStream(*/
      new BufferedOutputStream(os)/*,
                                    c
                                    )*/;
  }

  public void write(int i) {
    try {
      out.write(i);
      out.flush();
    }
    catch(IOException e) {
      e.printStackTrace();
    }
  }

  public void writeString(String s) {
    int len=s.length();
    byte[] buf=new byte[len];
    for (int i=0; i<buf.length; i++)
      buf[i]=(byte) s.charAt(i);

    try {
      write(len);
      out.write(buf);
      out.flush();
    }
    catch(IOException e) {
      e.printStackTrace();
    }
  }

  public void close() {
    try {
      out.flush();
      out.close();
    }
    catch(IOException e) {
      e.printStackTrace();
    }
  }
}
