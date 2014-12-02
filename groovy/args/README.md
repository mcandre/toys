# Example

```
$ mvn package
$ mvn exec:java -Dexec.mainClass=us.yellosoft.args.groovy.Args -Dexec.args="a b c"
[a, b, c]
```

# Code coverage

```
$ mvn site
$ open target/site/coburtura/index.html
```
