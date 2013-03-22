// YByteOutputStream
// Andrew Pennebaker
// July 7, 2004

import java.io.*;

public class YByteOutputStream extends ByteArrayOutputStream {
  public YByteOutputStream(byte[] newBuf) {
    super();
    buf=newBuf;
  }

  public byte[] getBytes() {
    return buf;
  }
}
