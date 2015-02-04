package us.yellosoft.bookbean;

import java.util.Date;
import java.util.Calendar;
import java.io.IOException;
import java.io.PipedOutputStream;
import java.io.PipedInputStream;
import java.io.ObjectOutputStream;
import java.io.ObjectInputStream;

import org.junit.Test;
import org.junit.Assert;

import us.yellosoft.bookbean.Book;

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
    Book defaultBook = new Book();
    Assert.assertEquals(true, true); // No errors thrown
  }

  @Test
  public void testSerializable() throws IOException, ClassNotFoundException {
    Book book2;

    PipedOutputStream pipedOut = new PipedOutputStream();
    PipedInputStream pipedIn = new PipedInputStream(pipedOut);

    ObjectOutputStream booksOut = new ObjectOutputStream(pipedOut);
    ObjectInputStream booksIn = new ObjectInputStream(pipedIn);

    booksOut.writeObject(BPWJFD);
    book2 = (Book) booksIn.readObject();

    booksOut.close();

    Assert.assertEquals(BPWJFD, book2);
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
}
