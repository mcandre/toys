# toys/jvm/java/orwell - Java Enum demo

# ABOUT

Java [Enum](http://docs.oracle.com/javase/7/docs/api/java/lang/Enum.html)s are behavior-less classes (like C enums or Haskell records). In Java, Enums integrate well with the class system, but they really shine in `switch()` blocks and serialization. If you are used to modelling data as Strings, consider using Enums instead, for more robustness.

# EXAMPLE

```console
$ gradle --warning-mode all test

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
        final Orwell o = Orwell.GOOD;

        switch (o) {
        case DOUBLE_PLUS_UNGOOD:
            Assert.assertTrue(true);
            break;
        case DOUBLE_UNGOOD:
            Assert.assertTrue(true);
            break;
        case UNGOOD:
            Assert.assertTrue(true);
            break;
        case GOOD:
            Assert.assertTrue(true);
            break;
        case DOUBLE_GOOD:
            Assert.assertTrue(true);
            break;
        case DOUBLE_PLUS_GOOD:
            Assert.assertTrue(true);
        default:
            Assert.assertTrue(false);
        }
    }
...
```

# REQUIREMENTS

* [JDK](http://www.oracle.com/technetwork/java/javase/downloads/index.html) 1.11+
* [Gradle](http://gradle.org/) 6+

## Optional

* [Sonar](http://www.sonarqube.org/)
* [Infer](http://fbinfer.com/)

E.g., `brew cask install java && brew install gradle sonar sonar-runner infer`

# JAVADOCS

```console
$ gradle --warning-mode all javadoc
$ open build/docs/javadoc/index.html
```

# TEST + CODE COVERAGE

```console
$ gradle --warning-mode all test jacoco
$ open build/reports/jacoco/test/html/index.html
```

# LINTING

```console
$ gradle --warning-mode all check
$ open build/reports/{checkstyle,pmd,spotbugs}/main.html
```

## Optional: Sonar

```console
$ sonar start
$ gradle --warning-mode all check sonar
$ open http://localhost:9000/
```

## Optional: Infer

```console
$ infer -- gradle --warning-mode all clean build
```
