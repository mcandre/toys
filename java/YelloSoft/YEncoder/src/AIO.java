//
// Andrew Input/Output
// Andrew Pennebaker
// June 9, 2004
//

import java.io.*;

/** Andrew's IO helper */
public final class AIO {
  /** utility class */
  private AIO() {}

  static BufferedReader keyboard = new BufferedReader(new InputStreamReader(
        System.in));

  /**
     <p>Open file for reading</p>
     @param fileLoc file path
     @return reader
  */
  public static BufferedReader open(final String fileLoc) {
    FileInputStream fis;

    try {
      fis = new FileInputStream(fileLoc);
    } catch (FileNotFoundException e) {
      return null;
    }

    InputStreamReader isr = new InputStreamReader(fis);
    BufferedReader br = new BufferedReader(isr);

    return br;
  }

  /**
     <p>Open file for reading</p>
     @param file file
     @return reader
  */
  public static BufferedReader open(final File file) {
    FileInputStream fis;

    try {
      fis = new FileInputStream(file);
    } catch (FileNotFoundException e) {
      return null;
    }

    InputStreamReader isr = new InputStreamReader(fis);
    BufferedReader br = new BufferedReader(isr);

    return br;
  }

  /**
     <p>Create file for writing</p>
     @param fileLoc file path
     @return writer
  */
  public static PrintStream create(final String fileLoc) {
    FileOutputStream fos;

    try {
      fos = new FileOutputStream(fileLoc);
    } catch (FileNotFoundException e) {
      return null;
    }

    PrintStream ps = new PrintStream(fos);

    return ps;
  }

  /**
     <p>Create file for writing</p>
     @param file file
     @return writer
  */
  public static PrintStream create(final File file) {
    FileOutputStream fos;

    try {
      fos = new FileOutputStream(file);
    } catch (FileNotFoundException e) {
      return null;
    }

    PrintStream ps = new PrintStream(fos);

    return ps;
  }

  /**
     <p>Prompt and read input from keyboard</p>
     @param s prompt
     @return keyboard input
  */
  public static String readKeyboard(final String s) {
    System.out.print(s);
    return read(keyboard);
  }

  /**
     <p>Read input from keyboard</p>
     @return keyboard input
  */
  public static String readKeyboard() {
    return readKeyboard("");
  }

  /**
     <p>Read from a reader</p>
     @param br reader
     @return input, or null on error
  */
  public static String read(final BufferedReader br) {
    try {
      return br.readLine();
    } catch (Exception e) {
      return null;
    }
  }

  /**
     <p>Write a string to a stream</p>
     @param ps stream
     @param s string
  */
  public static void write(final PrintStream ps, final String s) {
    ps.println(s);
  }
}
