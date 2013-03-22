// EncryptedInputStream
// Andrew Pennebaker
// July 13, 2004

import java.io.*;
import java.net.SocketException;
import javax.crypto.*;

public class EncryptedInputStream extends InputStream {
  private /*Cipher*/BufferedInputStream in;

  public EncryptedInputStream(InputStream is, Cipher c) {
    in=/*new CipherInputStream(*/
      new BufferedInputStream(is)/*,
                                   c
                                   )*/;
  }

  public int read() {
    try {
      return in.read();
    }
    catch(IOException e) {
      e.printStackTrace();
      return -1;
    }
  }

  public String readString() throws Exception {
    int len=(int) read();

    byte[] buf=new byte[len];
    in.read(buf);

    char[] stringChars=new char[buf.length];
    for (int i=0; i<stringChars.length; i++)
      stringChars[i]=(char) buf[i];

    return new String(stringChars);
  }
}
