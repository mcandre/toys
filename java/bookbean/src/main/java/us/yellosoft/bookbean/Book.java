package us.yellosoft.bookbean;

import java.io.Serializable;
import java.util.Date;

/** A Bean for Books */
public class Book implements Serializable, Comparable {
  public static final long serialVersionUID = 1L;

  // Attributes
  private String title;
  private String author;
  private String publisher;
  private Date published;
  private String isbn;

  /** 0-ary default constructor with reasonable defaults */
  public Book() {
    this.title = "";
    this.author = "";
    this.publisher = "";
    this.published = new Date();
    this.isbn = "";
  }

  /** All-at-once constructor. Not necessary for Beans, but helpful for anyone who hates calling
      .setThis(x), .setThat(y), .setTheOther(z) blah blah boilerplate code!

      @param title The book's title
      @param author The book's author(s)
      @param publisher The book's publisher
      @param published The book's publication date
      @param isbn The book's ISBN
  */
  public Book(
    final String title,
    final String author,
    final String publisher,
    final Date published,
    final String isbn
  ) {
    this.title = title;
    this.author = author;
    this.publisher = publisher;
    this.published = published;
    this.isbn = isbn;
  }

  // Nasty setter/getter boilerplate follows

  /** @return The book's title */
  public String getTitle() {
    return this.title;
  }
  /** @param title The book's title */
  public void setTitle(final String title) {
    this.title = title;
  }

  /** @return The book's author(s) */
  public String getAuthor() {
    return this.author;
  }
  /** @param author The book's author(s) */
  public void setAuthor(final String author) {
    this.author = author;
  }

  /** @return The book's publisher */
  public String getPublisher() {
    return this.publisher;
  }
  /** @param publisher The book's publisher */
  public void setPublisher(final String publisher) {
    this.publisher = publisher;
  }

  /** @return The book's publication date */
  public Date getPublished() {
    return this.published;
  }
  /** @param published The book's publication date */
  public void setPublished(final Date published) {
    this.published = published;
  }

  /** @return The book's ISBN */
  public String getISBN() {
    return this.isbn;
  }
  /** @param isbn The book's ISBN */
  public void setISBN(final String isbn) {
    this.isbn = isbn;
  }

  // Yuck! But now that's over, any external Java code can configure this Bean super easily.

  /** Compare by ISBN
      @param other another Book
      @return comparison value
  */
  public int compareTo(final Object other) {
    return this.isbn.compareTo(((Book) other).getISBN());
  }
  /** Equate by ISBN
      @param other another Object
      @return equation value
  */
  public boolean equals(final Object other) {
    return compareTo((Book) other) == 0;
  }
  /** @return a standardized hash code for this book */
  public int hashCode() {
    return new Long(Long.parseLong(this.isbn.replaceAll("-", ""))).hashCode();
  }

  /**
     Not necessary, but helpful for debugging
     @return String simple, informative string representation of this object
  */
  public String toString() {
    return this.title + " by " + this.author + " (ISBN " + this.isbn + ")";
  }
}
