from fabric.api import local

def test():
  local("python KenanKelQuote.py")

def guard():
  local("bundle exec guard")

def lint():
  local("pylint *.py; true")
