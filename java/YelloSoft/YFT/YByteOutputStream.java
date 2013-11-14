// YByteOutputStream
// Andrew Pennebaker
// July 7, 2004

import java.io.*;

public class YByteOutputStream extends ByteArrayOutputStream {
  public YByteOutputStream(final byte[] newBuf) {
    super();

    buf = newBuf;
  }

  public final byte[] getBytes() {
    return buf;
  }
}
