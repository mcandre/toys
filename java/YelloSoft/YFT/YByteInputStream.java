// YByteInputStream
// Andrew Pennebaker
// July 1, 2004

import java.io.*;

public class YByteInputStream extends ByteArrayInputStream {
  public YByteInputStream(final byte[] newBuf) {
    super(newBuf);
  }

  public final byte[] getBytes() {
    return buf;
  }
}
