package us.yellosoft.bf;

import java.util.Map;
import java.util.Scanner;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import org.docopt.Docopt;

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

        /** DocOpt usage spec */
        public static final String DOC = String.join(
        "\n",
        new String[] {
            "Usage:",
            "  Brainfuck [--debug] [<script>]",
            "  Brainfuck --version",
            "  Brainfuck --help",
            "Options:",
            "  -d --debug    Enable debugging output",
            "  -v --version  Show version information",
            "  -h --help     Show usage information"
        }
        );

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
            final Map<String, Object> options = new Docopt(DOC).withVersion(VERSION).parse(args);

            final String script = (String) options.get("<script>");

            final VM vm = new VM();

            if ((Boolean) options.get("--debug")) {
                vm.setDebug(true);
            }

            if (script != null) {
                scripted(vm, script);
            } else {
                interactive(vm);
            }
        }
    }
