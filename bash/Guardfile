guard :shell do
  watch(/lib\/.*/) do |m|
    title = 'Lint output'
    msg = 'Failure'
    status = :failed

    if `make lint`
      msg = 'Linted'
      status = :success
    end

    n msg, title, status

    "-> #{msg}"
  end
end
