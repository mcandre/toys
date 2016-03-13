# mcandre/java/orwell - Java Enum demo

# ABOUT

Java [Enum](http://docs.oracle.com/javase/7/docs/api/java/lang/Enum.html)s are behavior-less classes (like C enums or Haskell records). In Java, Enums integrate well with the class system, but they really shine in `switch()` blocks and serialization. If you are used to modelling data as Strings, consider using Enums instead, for more robustness.

# EXAMPLE

```
$ gradle test

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

* [JDK](http://www.oracle.com/technetwork/java/javase/downloads/index.html) 1.7+
* [Gradle](http://gradle.org/) 2.1+

## Optional

* [Sonar](http://www.sonarqube.org/)
* [Infer](http://fbinfer.com/)

E.g., `brew install gradle sonar sonar-runner infer`

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
