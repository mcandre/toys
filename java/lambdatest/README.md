# mcandre/java/lambdatest

Lambda example in Java

# EXAMPLE

```
$ mvn package
$ mvn exec:java -Dexec.mainClass=us.yellosoft.lambdatest.LambdaTest
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

# CODE COVERAGE

```
$ mvn site
$ open target/site/coburtura/index.html
```
