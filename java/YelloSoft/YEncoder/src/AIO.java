// Andrew Input/Output
// Andrew Pennebaker
// June 9, 2004

import java.io.*;

public class AIO {
  static BufferedReader keyboard=new BufferedReader(new InputStreamReader(System.in));

  // open file for reading
  public static BufferedReader open(String fileLoc) {
    FileInputStream fis;

    try {
      fis=new FileInputStream(fileLoc);
    }
    catch(FileNotFoundException e) {
      return null;
    }

    InputStreamReader isr=new InputStreamReader(fis);
    BufferedReader br=new BufferedReader(isr);

    return br;
  }

  // open file for reading
  public static BufferedReader open(File file) {
    FileInputStream fis;

    try {
      fis=new FileInputStream(file);
    }
    catch(FileNotFoundException e) {
      return null;
    }

    InputStreamReader isr=new InputStreamReader(fis);
    BufferedReader br=new BufferedReader(isr);

    return br;
  }

  // create file for writing
  public static PrintStream create(String fileLoc) {
    FileOutputStream fos;

    try {
      fos=new FileOutputStream(fileLoc);
    }
    catch(FileNotFoundException e) {
      return null;
    }

    PrintStream ps=new PrintStream(fos);

    return ps;
  }

  // create file for writing
  public static PrintStream create(File file) {
    FileOutputStream fos;

    try {
      fos=new FileOutputStream(file);
    }
    catch(FileNotFoundException e) {
      return null;
    }

    PrintStream ps=new PrintStream(fos);

    return ps;
  }

  public static String readKeyboard(String s) {
    System.out.print(s);
    return read(keyboard);
  }

  // read input from keyboard
  public static String readKeyboard() {
    return readKeyboard("");
  }

  public static String read(BufferedReader br) {
    try {
      return br.readLine();
    }
    catch(Exception e) {
      return null;
    }
  }

  public static void write(PrintStream ps, String s) {
    ps.println(s);
  }
}
