import org.junit.Test;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;

public class SimpleTest {
  @Test
  public final void testSomething() {
    assertTrue(new ArrayList().isEmpty());
  }

  public static junit.framework.Test suite() {
    return new junit.framework.JUnit4TestAdapter(SimpleTest.class);
  }

  public static void main(final String[] args) {
    org.junit.runner.JUnitCore.main("SimpleTest");
  }
}
