package us.yellosoft.fizzy;

import java.util.stream.IntStream;
import java.util.Arrays;

/** Example FizzBuzz implementation, parallelized */
public final class Fizzy {
  /** Utility class */
  private Fizzy() {}

  /** Modulo-based FizzBuzz implementation
      @param i Input number
      @return fizzbuzz(i)
   */
  public static String fizzbuzz(final int i) {
    boolean m = i % 3 == 0, n = i % 5 == 0;

    if (m && n) {
      return "FizzBuzz";
    } else if (m) {
      return "Fizz";
    } else if (n) {
      return "Buzz";
    } else {
      return String.valueOf(i);
    }
  }

  /** CLI entry point
      @param args CLI flags (unused)
   */
  public static void main(final String[] args) {
    final IntStream xs = IntStream.range(1, 101).parallel();
    final String[] ys = xs.mapToObj(Fizzy::fizzbuzz).toArray(String[]::new);

    System.out.println(Arrays.toString(ys));
  }
}
