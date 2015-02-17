# mcandre/java/orwell - Java Enum demo

# ABOUT

Java [Enum](http://docs.oracle.com/javase/7/docs/api/java/lang/Enum.html)s are behavior-less classes (like C enums or Haskell records). In Java, Enums integrate well with the class system, but they really shine in `switch()` blocks and serialization. If you are used to modelling data as Strings, consider using Enums instead, for more robustness.

# EXAMPLE

```
$ mvn test

$ cat src/main/java/us/yellosoft/orwell/Orwell.java
package us.yellosoft.orwell;

// An Enum for Orwellian Newspeak concepts
public enum Orwell {
  DOUBLE_PLUS_UNGOOD,
  DOUBLE_UNGOOD,
  UNGOOD,
  GOOD,
  DOUBLE_GOOD,
  DOUBLE_PLUS_GOOD
}

$ less src/test/java/us/yellosoft/orwell/OrwellTest.java
package us.yellosoft.orwell;

import org.junit.Test;
import org.junit.Assert;

import us.yellosoft.orwell.Orwell;

public class OrwellTest {

  @Test
  public void testCanSwitchOverOrwells() {
    switch(Orwell.GOOD) {
      default:
        Assert.assertTrue(true);
    }
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
