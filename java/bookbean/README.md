# mcandre/java/bookbean - Java Bean demo

# ABOUT

Java [Beans](https://en.wikipedia.org/wiki/JavaBeans) are a convention (like "Green means GO", or Haskell Monads). Any Java class is considered a Bean if it follows certain rules:

* Class has a 0-ary (no arguments) default constructor
* Class implements the Serializable inteface
* Class has getter and setter access methods for its attributes (at least the non-transient ones)

Why is it good for a Java class to be a Bean? Beans are easier:

* Easier to configure
* Easier to integrate into larger systems
* Easier to transmit
* Easier to store and load
* Easier to understand

Providing getters and setters for every single attribute might seem like wasted boilerplate code, but in the long run, your Java class becomes much more flexible in the Java ecosystem, allowing new and interesting uses--you would be surprised by how different developers and computer systems might want to configure and use your code!

Java beans follow the [Hollywood Principle](http://en.wikipedia.org/wiki/Hollywood_principle): "Don't call us, we'll call you!" By adhering to certain standards, your code integrates better with everyone else's code.

# EXAMPLE

```
$ mvn test

$ less src/main/java/us/yellosoft/bookbean/Book.java
package us.yellosoft.bookbean;

import java.io.Serializable;
import java.util.Date;

// A Bean for Books
public class Book implements Serializable, Comparable<Book> {
  public static final long serialVersionUID = 1L;

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

  public String getTitle() { return this.title; }
  public void setTitle(String title) { this.title = title; }
  ...

$ less src/test/java/us/yellosoft/bookbean/BookTest.java
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
...
```

# REQUIREMENTS

* [JDK](http://www.oracle.com/technetwork/java/javase/downloads/index.html) 1.7+
* [Gradle](http://gradle.org/) 2.1+

## Optional

* [Sonar](http://www.sonarqube.org/)
* [Infer](http://fbinfer.com/)

E.g., `brew install gradle sonar sonar-runner`

# JAVADOCS

```
$ gradle javadoc
$ open build/docs/javadoc/index.html
```

# TEST + CODE COVERAGE

```
$ gradle test jacoco
$ open build/reports/jacoco/test/html/index.html
```

# LINTING

```
$ gradle check

```

## Optional: FindBugs

```
$ gradle check
$ open build/reports/findbugs/main.html
```

## Optional: Sonar

```
$ sonar start
$ gradle check sonar
$ open http://localhost:9000/
```

## Optional: Infer

```
$ infer -- gradle clean build
```
