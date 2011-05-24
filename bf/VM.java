import java.util.ArrayList;
import java.io.IOException;

public class VM {
	public static char COMMENT='#';

	public ArrayList<Integer> tape;
	public int address;
	public String code;
	public int pos;
	public int step;
	public boolean debug;

	public VM() {
		debug=false;

		tape=new ArrayList<Integer>(0);
		tape.add(0);

		address=0;
		code="";
		pos=0;
		step=0;

		debug=false;
	}

	public static int count(String s, char c) {
		int count=0;

		for (int i=0; i<s.length(); i++) {
			if (s.charAt(i)==c) {
				count++;
			}
		}

		return count;
	}

	public static boolean valid(String level) {
		return count(level, '[')==count(level, ']');
	}

	// Assumes level is valid.
	public static String sublevel(String level) {
		int i=1;
		String slevel=level.substring(0, i);

		while (!valid(slevel)) {
			slevel=level.substring(0, i++);
		}

		return slevel.substring(1, i-2);
	}

	public int run(String level, int position) {
		while (position<level.length()) {
			step++;

			if (debug) {
				System.out.println(text_system());
			}

			char c=level.charAt(position);

			int t;

			switch(c) {
				case '+':
					tape.set(address, tape.get(address)+1);
					break;
				case '-':
					tape.set(address, tape.get(address)-1);

					break;
				case '>':
					address++;
					if (address==tape.size()) {
						tape.add(0);
					}
					break;
				case '<':
					address--;

					if (address<0) {
						address=0;
					}
					break;
				case '.':
					t=tape.get(address);
					System.out.print((char) t);
					break;
				case ',':
					try {
						tape.set(address, (int) System.in.read());
					}
					catch (IOException e) {
						System.out.println("Error reading from System.in");
					}
					break;
				case '[':
					String slevel=sublevel(level.substring(position));

					t=tape.get(address);
					while (t!=0) {
						run(slevel);
						t=tape.get(address);
					}

					position+=slevel.length()+1;
					break;
			}

			position++;
		}

		return position;
	}

	public int run(String level) {
		return run(level, 0);
	}

	public String eval(String command) {
		String result="";

		for (String cmd:command.split("\n")) {
			if (cmd.length()>0 && cmd.charAt(0)!=COMMENT) {
				code+=cmd;

				if (valid(code)) {
					pos=run(code, pos);

					result=""+tape.get(address);
				}
			}
		}

		return result;
	}

	public String text_system() {
		String result=(
			"--- Step "+step+" ---\n"+
			"Code:\n"+code+"\n"+
			"Position: "+pos+"\n"+
			"Command: "+code.charAt(pos)+"\n"
		);

		result+="Tape:\n";
		for (int i=0; i<tape.size()-1; i++) {
			result+=tape.get(i)+" ";
		}
		result+=tape.get(tape.size()-1);

		result+="\nAddress: "+address+"\n";
		result+="Value: "+tape.get(address);

		return result;
	}
}