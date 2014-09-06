task :flog => [] do
  sh 'bundle exec flog .'
end

task :churn => [] do
  sh 'bundle exec churn'
end

task :lili => [] do
  sh 'bundle exec lili .'
end

task :lint => [
  :flog,
  :churn,
  :lili
] do
end
