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

## Optional

* [Sonar](http://www.sonarqube.org/)

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
