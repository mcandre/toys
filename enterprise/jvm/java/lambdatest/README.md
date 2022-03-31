# lambdatest

A basic lambda example in Java

# EXAMPLE

```console
$ gradle --warning-mode all shadowJar
$ bin/lambdatest
[0, 2, 4, 6, 8, 10, 12, 14, 16, 18]
```

# REQUIREMENTS

* [JDK](http://www.oracle.com/technetwork/java/javase/downloads/index.html) 1.14
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
