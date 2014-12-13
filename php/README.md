# mcandre/php

Introductory PHP programs

# EXAMPLE

```
$ php hello.php 
<p>Hello World</p>php
```

# REQUIREMENTS

* [PHP](http://php.net/)

E.g., (built-in) (Mac OS X)

E.g., `sudo apt-get install apache2 php5 libapache2-mod-php5` (Debuntu)

E.g., `chocolatey install php` (Windows)

## OPTIONAL

* [Ruby](https://www.ruby-lang.org/en/)
* [Guard](http://guardgem.org/)

Install Guard:

```
$ bundle
```

# DEVELOPMENT

## LINT

```
$ make lint
```

## GUARD

Guard can automatically lint .php files as you code.

```
$ guard
$ emacs .
```
