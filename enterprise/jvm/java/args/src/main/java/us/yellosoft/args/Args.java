package us.yellosoft.args;

import java.util.Arrays;

/** Example CLI arg printing in Java */
public final class Args {
    /** Utility class */
    private Args() {}

    /** CLI entry point
     * @param args CLI flags
     */
    public static void main(final String[] args) {
        System.out.println(Arrays.toString(args));
    }
}
