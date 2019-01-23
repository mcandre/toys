package us.yellosoft.bookbean;

import java.util.Date;
import java.util.Calendar;
import java.io.IOException;
import java.io.PipedOutputStream;
import java.io.PipedInputStream;
import java.io.ObjectOutputStream;
import java.io.ObjectInputStream;
import java.util.Objects;

import org.junit.Test;
import org.junit.Assert;
import org.hamcrest.Matchers;

public class BookTest {
    public static final Book BPWJFD = new Book(
        "Beginning Programming with Java for Dummies",
        "Barry Burd",
        "Wiley",
        new Date(1403481600L),
        "978-1118407813"
    );

    @Test
    public void testZeroConfiguration() {
        Assert.assertEquals(new Book(), new Book());
    }

    @Test
    public void testEqual() {
        final Book book1 = new Book();
        book1.setIsbn("1");

        Assert.assertEquals(book1, book1);
    }

    @Test
    public void testInequality() {
        final Book book1 = new Book();
        book1.setIsbn("1");

        final Book book2 = new Book();
        book2.setIsbn("2");

        Assert.assertNotEquals(book1, book2);
    }

    @Test
    public void testComparable() {
        final Book book1 = new Book();
        book1.setIsbn("1");

        final Book book2 = new Book();
        book2.setIsbn("2");

        Assert.assertThat(book1, Matchers.lessThan(book2));
    }

    @Test
    public void testInequalityOthers() {
        final Book book = new Book();

        Assert.assertNotEquals(book, null);
        Assert.assertNotEquals(book, "");
    }

    @Test
    public void testSerializable() throws IOException, ClassNotFoundException {
        final Book book2;

        try (PipedOutputStream pipedOut = new PipedOutputStream();
            PipedInputStream pipedIn = new PipedInputStream(pipedOut);
            ObjectOutputStream booksOut = new ObjectOutputStream(pipedOut);
            ObjectInputStream booksIn = new ObjectInputStream(pipedIn)
        ) {

            booksOut.writeObject(BPWJFD);
            book2 = (Book) booksIn.readObject();

            Assert.assertEquals(BPWJFD, book2);
        }
    }

    @Test
    public void testHashable() {
        final Book book = new Book();
        book.setIsbn("978-3-16-148410-0");

        Assert.assertEquals(
            Objects.hash("978-3-16-148410-0"),
            book.hashCode()
        );
    }

    @Test
    public void testConfigurability() {
        final Calendar calendar1 = Calendar.getInstance();
        final Calendar calendar2 = Calendar.getInstance();

        final Book draft = new Book();
        draft.setTitle("Working Title");
        draft.setAuthor("Me");
        draft.setPublisher("LuLu");
        draft.setPublished(calendar1.getTime());
        draft.setIsbn("1");

        // 6 months later and we are already publishing a new edition
        draft.setTitle("Working Title, 2nd Edition");
        draft.setIsbn("2");
        calendar2.add(Calendar.MONTH, 6);
        draft.setPublished(calendar2.getTime());

        Assert.assertEquals(calendar2.getTime(), draft.getPublished());
    }

    @Test
    public void testConstructability() {
        final Calendar calendar = Calendar.getInstance();

        final Book draft = new Book(
            "*That Book*",
            "Me",
            "Dublisher Publishing",
            calendar.getTime(),
            "1"
        );

        // 6 months later and we are already publishing a new edition
        draft.setTitle("*That Book*, 2nd Edition");
        draft.setIsbn("2");
        calendar.add(Calendar.MONTH, 6);
        draft.setPublished(calendar.getTime());

        Assert.assertEquals(calendar.getTime(), draft.getPublished());
    }

    @Test
    public void testGetAttributes() {
        final Calendar calendar = Calendar.getInstance();
        final Date date = calendar.getTime();
        final Book draft = new Book(
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
        final Calendar calendar = Calendar.getInstance();
        final Date date = calendar.getTime();
        final Book draft = new Book(
            "Yet Another Book",
            "Me",
            "We Make Books, Inc.",
            date,
            "1"
        );

        Assert.assertEquals("Yet Another Book by Me (ISBN 1)", draft.toString());
    }
}
