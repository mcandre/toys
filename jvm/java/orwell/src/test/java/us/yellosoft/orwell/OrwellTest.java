package us.yellosoft.orwell;

import org.junit.Test;
import org.junit.Assert;

import us.yellosoft.orwell.Orwell;

public class OrwellTest {

  @Test
  public void testCanSwitchOverOrwells() {
    switch (Orwell.GOOD) {
    default:
      Assert.assertTrue(true);
    }
  }

  @Test
  public void testCanEnumerateAllValues() {
    Orwell[] values = Orwell.values();
    Assert.assertEquals(6, values.length);
  }

  @Test
  public void canPrintAndReadOrwells() {
    for (Orwell orwell : Orwell.values()) {
      Assert.assertEquals(orwell, Orwell.valueOf(orwell.toString()));
    }
  }
}
