# Hello World in Ruby

# REQUIREMENTS

* [Ruby](https://www.ruby-lang.org/) 2.0.0

# EXAMPLE

```
$ ruby hello.rb
Hello World!
```

# TESTING

```
$ cucumber
Feature: Print hello world

  Scenario: Running hello world    # features/print_hello_world.feature:3
    Given the program has finished # features/step_definitions/steps.rb:1
    Then the output is hello world # features/step_definitions/steps.rb:5

1 scenario (1 passed)
2 steps (2 passed)
0m0.201s
```
