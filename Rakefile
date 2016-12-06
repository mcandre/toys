task :flog => [] do
  sh 'bundle exec flog .'
end

task :churn => [] do
  sh 'bundle exec churn'
end

task :lili => [] do
  sh 'bundle exec lili .'
end

task :editorconfig=> [] do
  sh 'sh editorconfig.sh'
end

task :astyle_apply => [] do
  begin
    sh 'find . -type d -name android -prune -o -type f -name "*.java" -o -name "*.cpp" -o -name "*.[ch]" -exec astyle {} \\; | grep -v Unchanged'
  rescue
  end
end

task :astyle => [] do
  begin
    sh 'find . -type d -name android -prune -o -type f -name "*.java" -o -name "*.cpp" -o -name "*.[ch]" -exec astyle --dry-run {} \\; | grep -v Unchanged'
  rescue
  end
end

task :clean_astyle => [] do
  sh 'find . -type f -name "*.orig" -exec rm {} \\;'
end

task :xmllint => [] do
  sh 'find . -name "*.xml" -exec xmllint --noout {} 2>&1 \\;'
end

task :pep8 => [] do
  sh 'find . -name node_modules -prune -o -name bower_components -prune -o -name "*.py" -exec pep8 {} \\;'
end

task :jshint => [] do
  sh 'node_modules/.bin/jshint .'
end

task :jslint => [] do
  sh 'find . -type d -name node_modules -prune -o -type d -name bower_components -prune -o -type f -name "*[-.]min.js" -prune -o -type f -name "*.bat" -prune -o -type f -name "*.js" -exec node_modules/.bin/jslint {} \\;'
end

task :eslint => [] do
  sh 'node_modules/.bin/eslint .'
end

task :infernu => [] do
  sh 'find . -type d -name node_modules -prune -o -type d -name bower_components -prune -o -type d -name target -prune -o -type f -name "*.js" -exec infernu {} \\;'
end

task :gofmt => [] do
  sh 'gofmt -s -w .'
end

task :bashate => [] do
  sh 'find . \( -wholename \'*/.git/*\' -o -wholename \'*/node_modules*\' -o -name \'*.bat\' \) -prune -o -type f \( -wholename \'*/hooks/*\' -o -name \'*.sh\' -o -name \'*.bashrc*\' -o -name \'.*profile*\' -o -name \'*.envrc*\' \) -print | xargs bashate'
end

task :shlint => [] do
  sh 'find . \( -wholename \'*/.git/*\' -o -wholename \'*/node_modules*\' -o -name \'*.bat\' \) -prune -o -type f \( -wholename \'*/hooks/*\' -o -name \'*.sh\' -o -name \'*.bashrc*\' -o -name \'.*profile*\' -o -name \'*.envrc*\' \) -print | xargs shlint'
end

task :checkbashisms => [] do
  sh 'find . \( -wholename \'*/.git/*\' -o -wholename \'*/node_modules*\' -o -name \'*.bat\' \) -prune -o -type f \( -wholename \'*/hooks/*\' -o -name \'*.sh\' -o -name \'*.bashrc*\' -o -name \'.*profile*\' -o -name \'*.envrc*\' \) -print | xargs checkbashisms -n -p'
end

task :shellcheck => [] do
  sh 'find . \( -wholename \'*/.git/*\' -o -wholename \'*/node_modules*\' -o -name \'*.bat\' \) -prune -o -type f \( -wholename \'*/hooks/*\' -o -name \'*.sh\' -o -name \'*.bashrc*\' -o -name \'.*profile*\' -o -name \'*.envrc*\' \) -print | xargs shellcheck'
end

task :lint => [
  :flog,
  :churn,
  :lili,
  :editorconfig,
  :astyle,
  :xmllint,
  :pep8,
  :jshint,
  :jslint,
  :eslint,
  :infernu,
  :gofmt,
  :bashate,
  :shlint,
  :checkbashisms,
  :shellcheck
] do
end

task :clean => [
  :clean_astyle
] do
end
