# bookbean - Java Bean demo

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

# SECURITY AUDIT

```console
$ gradle audit snyk-test
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