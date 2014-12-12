# mcandre/java/fib

Fibonacci example in Java

# EXAMPLE

```
$ mvn package
$ mvn exec:java -Dexec.mainClass=us.yellosoft.fib.Fib
N = 10
Fib 10 = 55
```

# REQUIREMENTS

* [Java](http://www.oracle.com/technetwork/java/javase/downloads/index.html) 1.6+

# CODE COVERAGE

```
$ mvn site
$ open target/site/coburtura/index.html
```
