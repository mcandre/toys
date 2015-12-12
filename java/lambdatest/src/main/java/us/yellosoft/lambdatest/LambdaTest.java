package us.yellosoft.lambdatest;

import java.util.stream.IntStream;
import java.util.Arrays;

public class LambdaTest {
  /** Utility class */
  private LambdaTest() {}

  public static void main(String[] args) {
    final IntStream xs = IntStream.range(0, 10).parallel();
    final int[] ys = xs.map((int i) -> i * 2).toArray();

    System.out.println(Arrays.toString(ys));
  }
}
