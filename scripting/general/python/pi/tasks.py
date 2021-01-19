from invoke import run, task


@task
def safety():
    run('safety check')


@task
def pep8():
    run('pep8 .')


@task
def pylint():
    run('pylint *.py')


@task
def pyflakes():
    run('pyflakes .')


@task
def flake8():
    run('flake8 .')


@task
def tidy():
    run(
        'find . -type d -name node_modules -prune -o'
        ' -type f -name "*.html"'
        ' \\( -exec tidy -qe {} \\; -o -print \\) '
        '2>&1 |'
        'grep -v \'canvas>\' |'
        'grep -v \'proprietary attribute\''
        '; true'
    )


@task(pre=[safety, pep8, pylint, pyflakes, flake8, tidy])
def lint():
    pass
