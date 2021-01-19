package us.yellosoft.bookbean;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

/** A Bean for Books */
public final class Book implements Serializable, Comparable<Book> {
    public static final long serialVersionUID = 1L;

    /** The name of the book */
    private String title;
    /** The ones who write the book */
    private String author;
    /** The ones who receive money for the book */
    private String publisher;
    /** When the book was made */
    private Date published;
    /** The unique book identifier */
    private String isbn;

    /**
     * All-at-once constructor. Not necessary for Beans,
     * but helpful for anyone who hates calling .setThis(x),
     * .setThat(y), .setTheOther(z), etc. boilerplate code!
     *
     * @param title The book's title
     * @param author The book's author(s)
     * @param publisher The book's publisher
     * @param published The book's publication date
     * @param isbn The book's ISBN
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
        this.published = new Date(published.getTime());
        this.isbn = isbn;
    }

    /** 0-ary default constructor with reasonable defaults */
    public Book() {
        this("", "", "", new Date(), "");
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
        return new Date(this.published.getTime());
    }
    /** @param published The book's publication date */
    public void setPublished(final Date published) {
        this.published = new Date(published.getTime());
    }

    /** @return The book's ISBN */
    public String getIsbn() {
        return this.isbn;
    }
    /** @param isbn The book's ISBN */
    public void setIsbn(final String isbn) {
        this.isbn = isbn;
    }

    // Yuck! But now that's over,
    // any external Java code can configure this Bean super easily.

    @Override
    public int compareTo(final Book other) {
        return this.isbn.compareTo(other.getIsbn());
    }

    @Override
    public boolean equals(final Object o) {
        if (this == o) {
            return true;
        }

        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        final var book = (Book) o;
        return Objects.equals(isbn, book.isbn);
    }

    @Override
    public int hashCode() {
        return Objects.hash(isbn);
    }

    @Override
    public String toString() {
        return String.format("%s by %s (ISBN %s)", title, author, isbn);
    }
}
