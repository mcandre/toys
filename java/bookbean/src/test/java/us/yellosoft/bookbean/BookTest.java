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
    Book book1 = new Book();
    book1.setISBN("1");

    Assert.assertEquals(book1, book1);
  }

  @Test
  public void testUnequal() {
    Book book1 = new Book();
    book1.setISBN("1");
    Book book2 = new Book();
    book2.setISBN("2");

    Assert.assertNotEquals(book1, book2);
  }

  @Test
  public void testSerializable() throws IOException, ClassNotFoundException {
    Book book2;

    try (PipedOutputStream pipedOut = new PipedOutputStream();
         PipedInputStream pipedIn = new PipedInputStream(pipedOut);
         ObjectOutputStream booksOut = new ObjectOutputStream(pipedOut);
         ObjectInputStream booksIn = new ObjectInputStream(pipedIn)) {

      booksOut.writeObject(BPWJFD);
      book2 = (Book) booksIn.readObject();

      Assert.assertEquals(BPWJFD, book2);
    }
  }

  @Test
  public void testHashable() {
    Book book = new Book();
    book.setISBN("978-3-16-148410-0");

    Assert.assertEquals(
      Objects.hash("978-3-16-148410-0"),
      book.hashCode()
    );
  }

  @Test
  public void testConfigurability() {
    Calendar calendar = Calendar.getInstance();

    Book draft = new Book();
    draft.setTitle("Working Title");
    draft.setAuthor("Me");
    draft.setPublisher("LuLu");
    draft.setPublished(calendar.getTime());
    draft.setISBN("1");

    // 6 months later and we are already publishing a new edition
    draft.setTitle("Working Title, 2nd Edition");
    draft.setISBN("2");
    calendar.add(Calendar.MONTH, 6);
    draft.setPublished(calendar.getTime());

    Assert.assertEquals(calendar.getTime(), draft.getPublished());
  }

  @Test
  public void testConstructability() {
    Calendar calendar = Calendar.getInstance();

    Book draft = new Book(
      "Working Title",
      "Me",
      "LuLu",
      calendar.getTime(),
      "1"
    );

    // 6 months later and we are already publishing a new edition
    draft.setTitle("Working Title, 2nd Edition");
    draft.setISBN("2");
    calendar.add(Calendar.MONTH, 6);
    draft.setPublished(calendar.getTime());

    Assert.assertEquals(calendar.getTime(), draft.getPublished());
  }

  @Test
  public void testGetAttributes() {
    Calendar calendar = Calendar.getInstance();
    Date date = calendar.getTime();
    Book draft = new Book(
      "Working Title",
      "Me",
      "LuLu",
      date,
      "1"
    );

    Assert.assertEquals("Working Title", draft.getTitle());
    Assert.assertEquals("Me", draft.getAuthor());
    Assert.assertEquals("LuLu", draft.getPublisher());
    Assert.assertEquals(date, draft.getPublished());
    Assert.assertEquals("1", draft.getISBN());
  }

  @Test
  public void testPrinting() {
    Calendar calendar = Calendar.getInstance();
    Date date = calendar.getTime();
    Book draft = new Book(
      "Working Title",
      "Me",
      "LuLu",
      date,
      "1"
    );

    Assert.assertEquals("Working Title by Me (ISBN 1)", draft.toString());
  }
}
