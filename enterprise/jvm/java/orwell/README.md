# orwell - Java Enum demo

# ABOUT

Java [Enum](http://docs.oracle.com/javase/7/docs/api/java/lang/Enum.html)s are behavior-less classes (like C enums or Haskell records). In Java, Enums integrate well with the class system, but they really shine in `switch()` blocks and serialization. If you are used to modelling data as Strings, consider using Enums instead, for more robustness.

# EXAMPLE

```console
$ gradle --warning-mode all test
```

# REQUIREMENTS

* [JDK](http://www.oracle.com/technetwork/java/javase/downloads/index.html) 1.18
* [Gradle](http://gradle.org/) 7

## Recommended

* [accio](https://github.com/mcandre/accio) 0.0.2
* [Sonar](http://www.sonarqube.org/)
* [Infer](http://fbinfer.com/)

E.g., `brew cask install java && brew install gradle sonar sonar-runner infer`

# JAVADOCS

```console
$ gradle --warning-mode all javadoc
$ karp build/docs/javadoc/index.html
```

# TEST

```console
$ gradle --warning-mode all test
```

# SECURITY SCAN

```console
$ gradle audit
```

# LINTING

```console
$ gradle --warning-mode all check
$ karp build/reports/checkstyle/main.html
```

## Optional: Sonar

```console
$ sonar start
$ gradle --warning-mode all check sonar
$ karp http://localhost:9000/
```

## Optional: Infer

```console
$ infer -- gradle --warning-mode all clean build
```
