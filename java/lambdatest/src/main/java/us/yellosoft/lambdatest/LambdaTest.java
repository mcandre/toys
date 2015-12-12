package us.yellosoft.lambdatest;

import java.util.stream.IntStream;
import java.util.Arrays;

/** Example use of Java 8 lambdas */
public class LambdaTest {
  /** Utility class */
  private LambdaTest() {}

  /** CLI entry point
      @param args CLI flags (unused)
   */
  public static void main(final String[] args) {
    final IntStream xs = IntStream.range(0, 10).parallel();
    final int[] ys = xs.map((int i) -> i * 2).toArray();

    System.out.println(Arrays.toString(ys));
  }
}
