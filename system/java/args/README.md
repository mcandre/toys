# args

Command line argument printing in Java

# EXAMPLE

```console
$ gradle --warning-mode all shadowJar
$ bin/args a b c
[a, b, c]
```

# REQUIREMENTS

* [OpenJDK](https://openjdk.org/) 18.0.2.1+
* [Gradle](https://gradle.org/) 7.5.1+
* [Node.js](https://nodejs.org/en) 16.14.2+ with `npm install -g snyk1.996.0`

## Recommended

* [Infer](http://fbinfer.com/)
* [Sonar](http://www.sonarqube.org/)

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