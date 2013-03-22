// YByteInputStream
// Andrew Pennebaker
// July 1, 2004

import java.io.*;

public class YByteInputStream extends ByteArrayInputStream {
  public YByteInputStream(byte[] newBuf) {
    super(newBuf);
  }

  public byte[] getBytes() {
    return buf;
  }
}
