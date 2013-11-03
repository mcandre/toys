import java.io.IOException;

public final class YubNub {
  private YubNub() {}

  public static final String PARSER = "http://yubnub.org/parser/parse?command=";

  public static void go(final String command) throws IOException {
    Runtime.getRuntime().exec("open " + PARSER + command);
  }

  public static void main(final String[] args) throws IOException {
    if (args.length < 1) {
      go("");
    }
    else {
      String command = args[0];
      for (int i = 1; i < args.length; i++) {
        command += "+" + args[i];
      }

      go(command);
    }
  }
}
