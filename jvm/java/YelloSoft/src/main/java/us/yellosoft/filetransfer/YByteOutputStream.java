package us.yellosoft.filetransfer;

import java.io.*;

/** Mock of a byte output stream */
public class YByteOutputStream extends ByteArrayOutputStream {
  /**
   * <p>Construct a mock</p>
   * @param newBuf buffer
   */
  public YByteOutputStream(final byte[] newBuf) {
    super();

    buf = newBuf;
  }

  /**
   * <p>Get buffer</p>
   * @return buffer
   */
  public final byte[] getBytes() {
    return buf;
  }
}
