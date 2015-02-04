# mcandre/java/bookbean - Java Bean demo

# ABOUT

Java [Beans](https://en.wikipedia.org/wiki/JavaBeans) are a discipline (like kung-fu, or Haskell Monads). Any Java class is considered a Bean if it follows certain rules:

* Has a 0-ary (no arguments) default constructor
* Implements the Serializable inteface
* Has getter and setter access methods for its attributes (at least the non-transient ones)

Why is it good for a Java class to be a Bean? Beans are easier to configure (good default behavior, and setters for everything), and they integrate better in larger systems.

Providing getters and setters for every single attribute might seem like wasted boilerplate code, but in the long run, your Java class becomes much more flexible in the Java ecosystem, allowing new and interesting uses--you would be surprised by how different developers and computer systems might want to configure and use your code!

# EXAMPLE

```
$ mvn test

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

* [JDK](http://www.oracle.com/technetwork/java/javase/downloads/index.html) 1.6+
* [Maven](http://maven.apache.org/) 3+

# CODE COVERAGE

```
$ mvn site
$ open target/site/coburtura/index.html
```
