package us.yellosoft.bookbean;

import java.util.Date;
import java.io.IOException;
import java.io.PipedOutputStream;
import java.io.PipedInputStream;
import java.io.ObjectOutputStream;
import java.io.ObjectInputStream;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Objects;

import org.junit.Test;
import org.junit.Assert;
import org.hamcrest.Matchers;

public class BookTest {
    private static final ZoneId ZONE_ID = ZoneId.systemDefault();

    public static final Book BPWJFD = new Book(
        "Beginning Programming with Java for Dummies",
        "Barry Burd",
        "Wiley",
        new Date(1_403_481_600L),
        "978-1118407813"
    );

    @Test
    public void testZeroConfiguration() {
        Assert.assertEquals(new Book(), new Book());
    }

    @Test
    public void testEqual() {
        final var book1 = new Book();
        book1.setIsbn("1");

        Assert.assertEquals(book1, book1);
    }

    @Test
    public void testInequality() {
        final var book1 = new Book();
        book1.setIsbn("1");

        final var book2 = new Book();
        book2.setIsbn("2");

        Assert.assertNotEquals(book1, book2);
    }

    @Test
    public void testComparable() {
        final var book1 = new Book();
        book1.setIsbn("1");

        final var book2 = new Book();
        book2.setIsbn("2");

        Assert.assertThat(book1, Matchers.lessThan(book2));
    }

    @Test
    public void testInequalityOthers() {
        final var book = new Book();

        Assert.assertNotEquals(book, null);
        Assert.assertNotEquals(book, "");
    }

    @Test
    public void testSerializable() throws IOException, ClassNotFoundException {
        try (PipedOutputStream pipedOut = new PipedOutputStream();
            PipedInputStream pipedIn = new PipedInputStream(pipedOut);
            ObjectOutputStream booksOut = new ObjectOutputStream(pipedOut);
            ObjectInputStream booksIn = new ObjectInputStream(pipedIn)
        ) {

            booksOut.writeObject(BPWJFD);
            final var book2 = (Book) booksIn.readObject();

            Assert.assertEquals(BPWJFD, book2);
        }
    }

    @Test
    public void testHashable() {
        final var book = new Book();
        book.setIsbn("978-3-16-148410-0");

        Assert.assertEquals(
            Objects.hash("978-3-16-148410-0"),
            book.hashCode()
        );
    }

    @Test
    public void testConfigurability() {
        final var localDate1 = LocalDate.now();
        final var date1 = Date.from(localDate1.atStartOfDay(ZONE_ID).toInstant());

        final var draft = new Book();
        draft.setTitle("Working Title");
        draft.setAuthor("Me");
        draft.setPublisher("LuLu");
        draft.setPublished(date1);
        draft.setIsbn("1");

        // 6 months later and we are already publishing a new edition
        final var localDate2 = localDate1.plusMonths(6);
        final var date2 = Date.from(localDate2.atStartOfDay(ZONE_ID).toInstant());
        draft.setTitle("Working Title, 2nd Edition");
        draft.setPublished(date2);
        draft.setIsbn("2");

        Assert.assertEquals(date2, draft.getPublished());
    }

    @Test
    public void testConstructability() {
        final var localDate1 = LocalDate.now();
        final var date1 = Date.from(localDate1.atStartOfDay(ZONE_ID).toInstant());

        final var draft = new Book(
            "*That Book*",
            "Me",
            "Dublisher Publishing",
             date1,
            "1"
        );

        // 6 months later and we are already publishing a new edition
        final var localDate2 = localDate1.plusMonths(6);
        final var date2 = Date.from(localDate2.atStartOfDay(ZONE_ID).toInstant());
        draft.setTitle("*That Book*, 2nd Edition");
        draft.setIsbn("2");
        draft.setPublished(date2);

        Assert.assertEquals(date2, draft.getPublished());
    }

    @Test
    public void testGetAttributes() {
        final var localDate = LocalDate.now();
        final var date = Date.from(localDate.atStartOfDay(ZONE_ID).toInstant());

        final var draft = new Book(
            "The Not A Book Book",
            "Me",
            "PQR Publishing",
            date,
            "1"
        );

        Assert.assertEquals("The Not A Book Book", draft.getTitle());
        Assert.assertEquals("Me", draft.getAuthor());
        Assert.assertEquals("PQR Publishing", draft.getPublisher());
        Assert.assertEquals(date, draft.getPublished());
        Assert.assertEquals("1", draft.getIsbn());
    }

    @Test
    public void testPrinting() {
        final var date = LocalDate.now();

        final var draft = new Book(
            "Yet Another Book",
            "Me",
            "We Make Books, Inc.",
            Date.from(date.atStartOfDay(ZONE_ID).toInstant()),
            "1"
        );

        Assert.assertEquals("Yet Another Book by Me (ISBN 1)", draft.toString());
    }
}
