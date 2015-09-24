# mcandre/java/lambdatest

Lambda example in Java

# EXAMPLE

```
$ gradle shadowJar
$ bin/lambdatest
0
2
4
6
8
10
12
14
16
18
```

# REQUIREMENTS

* [JDK](http://www.oracle.com/technetwork/java/javase/downloads/index.html) 1.8+
* [Gradle](http://gradle.org/) 2.1+

E.g., `brew install gradle`

# JAVADOCS

```
$ gradle javadoc
$ open build/docs/javadoc/index.html
```

# CODE COVERAGE

```
$ gradle cobertura
$ open build/reports/coburtura/index.html
```

# LINTING

```
$ gradle check
```
