package us.yellosoft.bf;

import java.util.ArrayList;
import java.io.IOException;

/** Brainfuck virtual machine */
public class VM {
  /** Comment syntax */
  public static final char COMMENT = '#';

  private ArrayList<Integer> tape;
  private int address;
  private String code;
  private int pos;
  private int step;
  private boolean debug;

  /** Construct a Brainfuck virtual machine */
  public VM() {
    debug = false;

    tape = new ArrayList<Integer>(0);
    tape.add(0);

    address = 0;
    code = "";
    pos = 0;
    step = 0;

    debug = false;
  }

  /** Configure debug mode
   *  @param debug whether or not to print debugging statements during VM evaluation
   */
  public void setDebug(final boolean debug) {
    this.debug = debug;
  }

  /** Count occurences of c in s
   *  @param s a haystack
   *  @param c the needle
   *  @return frequency of c in s
   */
  public static int count(final String s, final char c) {
    int count = 0;

    for (int i = 0; i < s.length(); i++) {
      if (s.charAt(i) == c) {
        count++;
      }
    }

    return count;
  }

  /** Validate Brainfuck code
   *  @param level a segment of Brainfuck code
   *  @return whether the segment is valid
   */
  public static boolean valid(final String level) {
    return count(level, '[') == count(level, ']');
  }

  /**
   * Extract a subroutine within a level
   * Note: Assumes level is valid.
   * @param level the overall level
   * @return a sublevel
   */
  public static String sublevel(final String level) {
    int i = 1;
    String slevel = level.substring(0, i);

    while (!valid(slevel)) {
      slevel = level.substring(0, i++);
    }

    return slevel.substring(1, i - 2);
  }

  /** Execute Brainfuck machine
   *  @param level a segment of Brainfuck code
   *  @param position initial read position
   *  @return the read position after evaluation
   */
  public int run(final String level, final int position) {
    int currentPosition = position;

    while (currentPosition < level.length()) {
      step++;

      if (debug) {
        System.out.println(textSystem());
      }

      char c = level.charAt(currentPosition);

      int t;

      switch (c) {
      case '+':
        tape.set(address, tape.get(address) + 1);
        break;

      case '-':
        tape.set(address, tape.get(address) - 1);

        break;

      case '>':
        address++;

        if (address == tape.size()) {
          tape.add(0);
        }

        break;

      case '<':
        address--;

        if (address < 0) {
          address = 0;
        }

        break;

      case '.':
        t = tape.get(address);
        System.out.print((char) t);
        break;

      case ',':
        try {
          tape.set(address, System.in.read());
        } catch (IOException e) {
          System.out.println("Error reading from System.in");
        }

        break;

      case '[':
        String slevel = sublevel(level.substring(currentPosition));

        t = tape.get(address);

        while (t != 0) {
          run(slevel);
          t = tape.get(address);
        }

        currentPosition += slevel.length() + 1;
        break;
      default:
        // Treat non-operator characters as comments
        break;
      }

      currentPosition++;
    }

    return currentPosition;
  }

  /**
   * Execute Brainfuck code
   * @param level a segment of Brainfuck code
   * @return the read position after evaluation
   */
  public int run(final String level) {
    return run(level, 0);
  }

  /**
   * Add a segment to the current Brainfuck context
   * @param command a new Brainfuck segment
   * @return the current tape value
   */
  public String eval(final String command) {
    String result = "";

    for (String cmd : command.split("\n")) {
      if (cmd.length() > 0 && cmd.charAt(0) != COMMENT) {
        code += cmd;

        if (valid(code)) {
          pos = run(code, pos);

          result = "" + tape.get(address);
        }
      }
    }

    return result;
  }

  /**
   * Debug state
   * @return state
   */
  public String textSystem() {
    StringBuilder stringBuilder = new StringBuilder(
      "--- Step " + step + " ---\n" +
      "Code:\n" + code + "\n" +
      "Position: " + pos + "\n" +
      "Command: " + code.charAt(pos) + "\n"
    );
    stringBuilder.append("Tape:\n");

    for (int i = 0; i < tape.size() - 1; i++) {
      stringBuilder.append("" + tape.get(i) + " ");
    }

    stringBuilder.append("" + tape.get(tape.size() - 1));

    stringBuilder.append("\nAddress: " + address + "\n");
    stringBuilder.append("Value: " + tape.get(address));

    return stringBuilder.toString();
  }
}
