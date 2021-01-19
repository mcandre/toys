package us.yellosoft.orwell;

import org.junit.Test;
import org.junit.Assert;

import us.yellosoft.orwell.Orwell;

public class OrwellTest {
    @Test
    public void testCanSwitchOverOrwells() {
        final var o = Orwell.GOOD;

        switch (o) {
        case DOUBLE_PLUS_UNGOOD:
            Assert.assertTrue(true);
            break;
        case DOUBLE_UNGOOD:
            Assert.assertTrue(true);
            break;
        case UNGOOD:
            Assert.assertTrue(true);
            break;
        case GOOD:
            Assert.assertTrue(true);
            break;
        case DOUBLE_GOOD:
            Assert.assertTrue(true);
            break;
        case DOUBLE_PLUS_GOOD:
            Assert.assertTrue(true);
        default:
            Assert.assertTrue(false);
        }
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
