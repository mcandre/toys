def printargs(params)
	if params[:dog]==nil
		params[:dog]="fuzzydog"
	end

	params.each { |key, value|
		puts "#{key} => #{value}"
	}
end

printargs(:cat => "fuzzycat")