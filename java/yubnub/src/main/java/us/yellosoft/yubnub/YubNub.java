package us.yellosoft.yubnub;

import java.io.IOException;

/** YubNub launcher **/
public final class YubNub {
  /** YubNub command URI */
  public static final String PARSER = "http://yubnub.org/parser/parse?command=";

  /** utility class */
  private YubNub() {}

  /**
     <p>Execute YubNub command in system default browser</p>
     @param command a YubNub command
     @throws IOException on CLI error
  */
  public static void go(final String command) throws IOException {
    Runtime.getRuntime().exec("open " + PARSER + command);
  }

  /**
     <p>CLI</p>
     @param args CLI arguments
     @throws IOException on CLI error
  */
  public static void main(final String[] args) throws IOException {
    if (args.length < 1) {
      go("");
    } else {
      String command = args[0];

      for (int i = 1; i < args.length; i++) {
        command += "+" + args[i];
      }

      go(command);
    }
  }
}
