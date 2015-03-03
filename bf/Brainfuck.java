import java.util.ArrayList;
import java.io.*;

import gnu.getopt.Getopt;
import gnu.getopt.LongOpt;

public class Brainfuck {
  public static String APP="Brainfuck";
  public static String VERSION="0.0.1";
  public static String COPYRIGHT="Copyright 2009 YelloSoft";
  public static String WELCOME="Use \'exit\' or Control-C to quit.";
  public static String INTERACTIVE_EXIT="exit";

  public static void version() {
    System.out.println(APP+" "+VERSION);
    System.exit(0);
  }

  public static void welcome() {
    System.out.println(APP+" "+VERSION+" "+COPYRIGHT+"\n"+WELCOME);
  }

  public static void usage() {
    System.out.println(
      "Usage: Brainfuck [options] [script]\n"+
      "--debug, -d:\n"+
      "    enable debug mode\n"+
      "--help, -h:\n"+
      "    show help\n"+
      "--version, -v\n"+
      "    show version"
    );

    System.exit(0);
  }

  public static void interactive(VM vm) {
    welcome();

    try {
      BufferedReader br=new BufferedReader(new InputStreamReader(System.in));

      String line=br.readLine();

      while (line!=null) {
        String result=vm.eval(line);
        if (result.length()>0) {
          System.out.println(result);
        }

        line=br.readLine();
      }
    }
    catch (IOException e) {
      System.out.println("Error: "+e);
    }
  }

  public static void scripted(VM vm, String script) {
    try {
      BufferedReader br=new BufferedReader(new FileReader(new File(script)));

      String line=br.readLine();

      while (line!=null) {
        vm.eval(line);
        line=br.readLine();
      }
    }
    catch (IOException e) {
      System.out.println("Error reading file "+script);
    }
  }

  public static void main(String[] args) {
    String mode="scripted";

    String script="";

    VM vm=new VM();

    if (args.length<1) {
      usage();
    }

    StringBuffer valueBuffer=new StringBuffer();

    LongOpt[] longOpts={
      new LongOpt("debug", LongOpt.NO_ARGUMENT, null, 'd'),
      new LongOpt("help", LongOpt.NO_ARGUMENT, null, 'h'),
      new LongOpt("version", LongOpt.NO_ARGUMENT, null, 'v')
    };

    Getopt g=new Getopt("Brainfuck", args, "dhv", longOpts);
    g.setOpterr(false);

    int c=g.getopt();
    while (c!=-1) {
      switch(c) {
      case 'd':
        vm.debug=true;
        break;
      case 'v':
        version();
        break;
      default:
        usage();
        break;
      }

      c=g.getopt();
    }

    ArrayList<String> leftoverArgs=new ArrayList<String>();

    for (int i=g.getOptind(); i<args.length; i++) {
      leftoverArgs.add(args[i]);
    }

    if (leftoverArgs.size()<1) {
      mode="interactive";
    }
    else {
      script=leftoverArgs.get(0);
    }

    if (mode=="interactive") {
      interactive(vm);
    }
    else if (mode=="scripted") {
      scripted(vm, script);
    }
  }
}

/*

  def main
  mode = :scripted

  script=""

  vm=VM.new

  opts=GetoptLong.new(
  ["--debug", "-d", GetoptLong::NO_ARGUMENT],
  ["--help", "-h", GetoptLong::NO_ARGUMENT],
  ["--version", "-v", GetoptLong::NO_ARGUMENT]
  )

  opts.each { |option, value|
  case option
  when "--debug"
  vm.debug=true
  when "--help"
  RDoc::usage("Usage")
  when "--version"
  version
  end
  }

  if ARGV.length<1
  mode = :interactive
  end

  case mode
  when :interactive
  vm.interactive
  when :scripted
  vm.scripted(ARGV[0])
  end
  end */
