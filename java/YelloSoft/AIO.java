// Andrew Input/Output
// Andrew Pennebaker
// June 9, 2004

import java.io.*;

public final class AIO {
  static BufferedReader keyboard = new BufferedReader(new InputStreamReader(System.in));

  /** <p>No instance methods, only static methods.</p> */
  private AIO() {}

  // open file for reading
  public static BufferedReader open(final String fileLoc) {
    FileInputStream fis;

    try {
      fis = new FileInputStream(fileLoc);
    }
    catch (FileNotFoundException e) {
      return null;
    }

    InputStreamReader isr = new InputStreamReader(fis);
    BufferedReader br = new BufferedReader(isr);

    return br;
  }

  // open file for reading
  public static BufferedReader open(File file) {
    FileInputStream fis;

    try {
      fis = new FileInputStream(file);
    }
    catch (FileNotFoundException e) {
      return null;
    }

    InputStreamReader isr = new InputStreamReader(fis);
    BufferedReader br = new BufferedReader(isr);

    return br;
  }

  // create file for writing
  public static PrintStream create(final String fileLoc) {
    FileOutputStream fos;

    try {
      fos = new FileOutputStream(fileLoc);
    }
    catch (FileNotFoundException e) {
      return null;
    }

    PrintStream ps = new PrintStream(fos);

    return ps;
  }

  // create file for writing
  public static PrintStream create(final File file) {
    FileOutputStream fos;

    try {
      fos = new FileOutputStream(file);
    }
    catch (FileNotFoundException e) {
      return null;
    }

    PrintStream ps = new PrintStream(fos);

    return ps;
  }

  public static String readKeyboard(final String s) {
    System.out.print(s);
    return read(keyboard);
  }

  // read input from keyboard
  public static String readKeyboard() {
    return readKeyboard("");
  }

  public static String read(final BufferedReader br) {
    try {
      return br.readLine();
    }
    catch (Exception e) {
      return null;
    }
  }

  public static void write(final PrintStream ps, final String s) {
    ps.println(s);
  }
}
