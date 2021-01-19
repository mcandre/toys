# hello

Hello World in Java

# EXAMPLE

```console
$ gradle --warning-mode all shadowJar
$ bin/hello
Hello World!
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
