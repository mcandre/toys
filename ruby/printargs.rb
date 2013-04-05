def printargs(params)
  unless params[:dog]
    params[:dog] = "fuzzydog"
  end

  params.each { |key, value|
    puts "#{key} => #{value}"
  }
end

printargs(:cat => "fuzzycat")
