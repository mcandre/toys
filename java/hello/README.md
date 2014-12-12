# mcandre/java/hello

Hello World in Java

# EXAMPLE

```
$ mvn package
$ mvn exec:java -Dexec.mainClass=us.yellosoft.hello.Hello
Hello World
```

# REQUIREMENTS

* [JDK](http://www.oracle.com/technetwork/java/javase/downloads/index.html) 1.6+

# CODE COVERAGE

```
$ mvn site
$ open target/site/coburtura/index.html
```
