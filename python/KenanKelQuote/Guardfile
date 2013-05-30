guard :shell do
  watch(/(.+)\.py/) do |m|
    title = "Test output"
    msg = "Python error"
    status = :failed

    output = `python #{m[1]}.py`

    if $?.success?
      msg = output
      status = :success
    end

    n msg, title, status

    "-> #{msg}"
  end
end
