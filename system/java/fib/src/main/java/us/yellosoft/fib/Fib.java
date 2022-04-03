package us.yellosoft.fib;

import com.google.common.base.Preconditions;

import java.util.Scanner;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

/** Fibonacci */
public final class Fib {
    /** utility class */
    private Fib() {}

    /**
     * <p>Fibonacci</p>
     *
     * @param n input
     *
     * @return fib(n)
     */
    public static int fib(final int n) {
        Preconditions.checkArgument(n >= 0);

        if (n < 2) {
            return n;
        }

        var a = 0;
        var b = 1;
        final var m = n - 1;

        for (var i = 0; i < m; i++) {
            final var c = a;
            a = b;
            b = c + b;
        }

        return b;
    }

    /**
     * <p>Timed Fibonacci test</p>
     *
     * @param args CLI args
     *
     * @throws IOException on CLI read error
     */
    public static void main(final String[] args) throws IOException {
        System.out.print("N = ");

        try (Scanner scanner = new Scanner(System.in, StandardCharsets.UTF_8.name())) {
            final var n = scanner.nextInt();

            System.out.println("Running");

            final var startt = (int) System.currentTimeMillis();
            final var x = fib(n);
            final var endt = (int) System.currentTimeMillis();

            System.out.println(String.format("Fib %d = %d", n, x));
            System.out.println(String.format("Time = %d sec", (endt - startt) / 1000));
        }
    }
}
