package us.yellosoft.orwell;

import org.junit.Test;
import org.junit.Assert;

import us.yellosoft.orwell.Orwell;

public class OrwellTest {
    @Test
    public void testCanSwitchOverOrwells() {
        final var o = Orwell.GOOD;

        Assert.assertTrue(switch (o) {
            case DOUBLE_PLUS_UNGOOD, DOUBLE_UNGOOD, UNGOOD, GOOD, DOUBLE_GOOD, DOUBLE_PLUS_GOOD -> true;
            default -> false;
        });
    }

    @Test
    public void testCanEnumerateAllValues() {
        final var values = Orwell.values();
        Assert.assertEquals(6, values.length);
    }

    @Test
    public void canPrintAndReadOrwells() {
        for (final var orwell : Orwell.values()) {
            Assert.assertEquals(orwell, Orwell.valueOf(orwell.toString()));
        }
    }
}
