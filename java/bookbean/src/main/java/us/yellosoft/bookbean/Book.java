package us.yellosoft.bookbean;

import java.io.Serializable;
import java.util.Date;

// A Bean for Books
public class Book implements Serializable, Comparable {
  // Attributes
  private String title;
  private String author;
  private String publisher;
  private Date published;
  private String isbn;

  // 0-ary default constructor with reasonable defaults
  public Book() {
    this.title = "";
    this.author = "";
    this.publisher = "";
    this.published = new Date();
    this.isbn = "";
  }

  // Not necessary for Beans, but helpful for anyone who hates calling
  // .setThis(x), .setThat(y), .setTheOther(z) blah blah boilerplate code!
  public Book(
    String title,
    String author,
    String publisher,
    Date published,
    String isbn
  ) {
    this.title = title;
    this.author = author;
    this.publisher = publisher;
    this.published = published;
    this.isbn = isbn;
  }

  // Nasty setter/getter boilerplate follows

  public String getTitle() {
    return this.title;
  }
  public void setTitle(String title) {
    this.title = title;
  }

  public String getAuthor() {
    return this.author;
  }
  public void setAuthor(String author) {
    this.author = author;
  }

  public String getPublisher() {
    return this.publisher;
  }
  public void setPublisher(String publisher) {
    this.publisher = publisher;
  }

  public Date getPublished() {
    return this.published;
  }
  public void setPublished(Date published) {
    this.published = published;
  }

  public String getISBN() {
    return this.isbn;
  }
  public void setISBN(String isbn) {
    this.isbn = isbn;
  }

  // Yuck! But now that's over, any external Java code can configure this Bean super easily.

  // Not necessary, but helpful for sorting
  public int compareTo(Object other) {
    return this.isbn.compareTo(((Book) other).getISBN());
  }
  public boolean equals(Object other) {
    return compareTo(other) == 0;
  }

  // Not necessary, but helpful for debugging
  public String toString() {
    return this.title + " by " + this.author + " (ISBN " + this.isbn + ")";
  }
}
