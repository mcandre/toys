package us.yellosoft.lambdatest;

import java.util.List;
import java.util.ArrayList;
import java.util.stream.Stream;
import java.util.stream.Collectors;

public class LambdaTest {
  public static void main(String[] args) {
    final ArrayList<Integer> xsList = new ArrayList<Integer>();

    for (Integer i = 0; i < 10; i++) {
      xsList.add(i);
    }

    final Stream<Integer> xsParallelStream = xsList.stream().parallel();

    final List<Integer> ys = xsParallelStream
      .map((Integer i) -> i * 2)
      .collect(Collectors.toList());

    for (final Integer y : ys) {
      System.out.println(y);
    }

    System.exit(0);
  }
}
