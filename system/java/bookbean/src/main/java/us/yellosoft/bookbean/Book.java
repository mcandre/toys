package us.yellosoft.bookbean;

import java.io.Serializable;
import java.util.Date;

/** A Bean for Books
 * @param title The book's title
 * @param author The book's author(s)
 * @param publisher The book's publisher
 * @param published The book's publication date
 * @param isbn The book's ISBN */
public record Book(String title, String author, String publisher, Date published, String isbn) implements Serializable, Comparable<Book> {
    public Book() {
        this("", "", "", new Date(), "");
    }

    public int compareTo(final Book other) {
        return isbn.compareTo(other.isbn());
    }

    public boolean equals(final Object o) {
        if (this == o) {
            return true;
        }

        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        final var book = (Book) o;
        return isbn.equals(book.isbn);
    }

    public int hashCode() {
        return isbn.hashCode();
    }

    public String toString() {
        return String.format("%s by %s (ISBN %s)", title, author, isbn);
    }
};
