guard :shell do
  watch(/^Rakefile|\..*|(.*\.rb)$/) do |m|
    title = 'Lint'
    eager 'rake lint'
    status = ($?.success? && :success) || :failed
    n '', title, status
    ''
  end
end
