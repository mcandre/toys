package us.yellosoft.filetransfer;

import java.io.*;

/** Mock of a byte input stream */
public class YByteInputStream extends ByteArrayInputStream {
  /**
     <p>Construct a mock</p>
     @param newBuf buffer
  */
  public YByteInputStream(final byte[] newBuf) {
    super(newBuf);
  }

  /**
     <p>Get buffer</p>
     @return buffer
  */
  public final byte[] getBytes() {
    return buf;
  }
}
