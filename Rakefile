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
  sh 'find . -type d -name .git -prune -o -name "*.app*" -prune -o -type f -name "*.scpt" -prune -o -type d -name .xcodeproj -prune -o -type f -name .exe -prune -o -type f -name "*" -exec editorconfig-tools check {} \\;'
end

task :lint => [
  :flog,
  :churn,
  :lili,
  :editorconfig
] do
end
