guard :shell do
  watch(/^Makefile|.*\.(erl|escript)$/) do |m|
    title = 'Lint'
    eager 'make lint'
    status = ($?.success? && :success) || :failed
    n '', title, status
    ''
  end
end
