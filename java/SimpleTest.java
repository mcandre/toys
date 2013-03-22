import org.junit.*;
import static org.junit.Assert.*;

import java.util.*;

public class SimpleTest {
  @Test
  public void testSomething() {
    assertTrue(new ArrayList().isEmpty());
  }

  public static junit.framework.Test suite() {
    return new junit.framework.JUnit4TestAdapter(SimpleTest.class);
  }

  public static void main(String[] args) {
    org.junit.runner.JUnitCore.main("SimpleTest");
  }
}
