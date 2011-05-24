import java.io.IOException;

public class YubNub {
	public static final String parser="http://yubnub.org/parser/parse?command=";

	public static void go(String command) {
		try {
			Runtime.getRuntime().exec("open "+parser+command);
		}
		catch(IOException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		if (args.length<1) {
			go("");
		}
		else {
			String command=args[0];
			for (int i=1; i<args.length; i++) {
				command+="+"+args[i];
			}

			go(command);
		}
	}
}