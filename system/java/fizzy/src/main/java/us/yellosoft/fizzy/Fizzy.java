package us.yellosoft.fizzy;

import java.util.stream.IntStream;

/** Example FizzBuzz implementation, parallelized */
public final class Fizzy {
    /** Utility class */
    private Fizzy() {}

    /** Modulo-based FizzBuzz implementation
     *
     * @param i Input number
     *
     * @return fizzbuzz(i)
     */
    public static String fizzbuzz(final int i) {
        final var m = i % 3 == 0;
        final var n = i % 5 == 0;

        if (m && n) {
            return "FizzBuzz";
        }

        if (m) {
            return "Fizz";
        }

        if (n) {
            return "Buzz";
        }

        return String.valueOf(i);
    }

    /** CLI entry point
     *  @param args CLI flags (unused)
     */
    public static void main(final String[] args) {
        final Iterable<String> strings = () -> IntStream
            .range(1, 101)
            .parallel()
            .mapToObj(Fizzy::fizzbuzz)
            .iterator();

        for (final var s: strings) {
            System.out.println(s);
        }
    }
}
