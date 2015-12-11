package us.yellosoft.bf;

import java.util.ArrayList;
import java.util.Scanner;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import gnu.getopt.Getopt;
import gnu.getopt.LongOpt;

/** A Brainfuck interpreter in Java */
public final class Brainfuck {
  /** Utility class */
  private Brainfuck() {}

  /** Application name */
  public static final String APP = "Brainfuck";
  /** Version number */
  public static final String VERSION = "0.0.1";
  /** Copyright */
  public static final String COPYRIGHT = "Copyright 2009 YelloSoft";
  /** Welcome banner */
  public static final String WELCOME = "Use \'exit\' or Control-C to quit.";
  /** Exit command */
  public static final String INTERACTIVE_EXIT = "exit";

  /** Print version number */
  public static void version() {
    System.out.println(APP + " " + VERSION);
    System.exit(0);
  }

  /** Print welcome banner */
  public static void welcome() {
    System.out.println(APP + " " + VERSION + " " + COPYRIGHT + "\n" + WELCOME);
  }

  /** Print usage information */
  public static void usage() {
    System.out.println(
      "Usage: Brainfuck [options] [script]\n" +
      "--debug, -d:\n" +
      "    enable debug mode\n" +
      "--help, -h:\n" +
      "    show help\n" +
      "--version, -v\n" +
      "    show version"
    );

    System.exit(0);
  }

  /** Drive Brainfuck VM by REPL
      @param vm a Brainfuck context
   */
  public static void interactive(final VM vm) {
    welcome();

    try (Scanner scanner = new Scanner(System.in, StandardCharsets.UTF_8.name())) {
      while (scanner.hasNextLine()) {
        String line = scanner.nextLine();
        String result = vm.eval(line);

        if (result.length() > 0) {
          System.out.println(result);
        }
      }
    }
  }

  /** Drive Brainfuck VM with script
      @param vm a Brainfuck context
      @param script Brainfuck code to execute
   */
  public static void scripted(final VM vm, final String script) {
    try (Scanner scanner = new Scanner(new File(script), StandardCharsets.UTF_8.name())) {
      while (scanner.hasNextLine()) {
        String line = scanner.nextLine();
        vm.eval(line);
      }
    } catch (IOException e) {
      System.out.println("Error reading file " + script);
    }
  }

  /** CLI entry point
      @param args CLI flags
   */
  public static void main(final String[] args) {
    String mode = "scripted";

    String script = "";

    VM vm = new VM();

    if (args.length < 1) {
      usage();
    }

    LongOpt[] longOpts = {
      new LongOpt("debug", LongOpt.NO_ARGUMENT, null, 'd'),
      new LongOpt("help", LongOpt.NO_ARGUMENT, null, 'h'),
      new LongOpt("version", LongOpt.NO_ARGUMENT, null, 'v')
    };

    Getopt g = new Getopt("Brainfuck", args, "dhv", longOpts);
    g.setOpterr(false);

    int c = g.getopt();

    while (c != -1) {
      switch (c) {
      case 'd':
        vm.setDebug(true);
        break;

      case 'v':
        version();
        break;

      default:
        usage();
        break;
      }

      c = g.getopt();
    }

    ArrayList<String> leftoverArgs = new ArrayList<String>();

    for (int i = g.getOptind(); i < args.length; i++) {
      leftoverArgs.add(args[i]);
    }

    if (leftoverArgs.size() < 1) {
      mode = "interactive";
    } else {
      script = leftoverArgs.get(0);
    }

    if (mode == "interactive") {
      interactive(vm);
    } else if (mode == "scripted") {
      scripted(vm, script);
    }
  }
}
