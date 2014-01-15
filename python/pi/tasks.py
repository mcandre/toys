from invoke import run, task

@task
def pep8():
  run("pep8 .")

@task
def pylint():
  run("pylint *.py")

@task
def pyflakes():
  run("pyflakes .")

@task
def tidy():
  run("find . -type f -name '*.html' -print -exec tidy -qe {} \; 2>&1")

@task("pep8", "pylint", "pyflakes", "tidy")
def lint():
  pass
