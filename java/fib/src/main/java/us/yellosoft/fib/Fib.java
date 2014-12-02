package us.yellosoft.fib;

import java.io.IOException;
import java.io.BufferedReader;
import java.io.InputStreamReader;

/** Fibonacci */
public final class Fib {
  /** utility class */
  private Fib() {}

  /**
     <p>Fibonacci</p>
     @param n input
     @return fib(n)
  */
  public static int fib(final int n) {
    if (n < 2) {
      return n;
    }
    else {
      int a = 0, b = 1;
      int m = n - 1;

      for (int i = 0; i < m; i++) {
        int c = a;
        a = b;
        b = c + b;
      }

      return b;
    }
  }

  /**
     <p>Timed Fibonacci test</p>
     @param args CLI args
     @throws IOException on CLI read error
  */
  public static void main(final String[] args) throws IOException {
    System.out.print("N = ");

    BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

    int n = Integer.parseInt(br.readLine());
    br.close();

    System.out.println("Running");

    int startt = (int) System.currentTimeMillis();

    int x = fib(n);

    int endt = (int) System.currentTimeMillis();

    System.out.println("Fib " + n + " = " + x);
    System.out.println("Time = " + ((endt - startt) / 1000) + " sec");
  }
}
