## read movie list ##
movie_list = Array.new
File.open('../input/movie_list.mat').each_line { |line|
	movie_list.push(line.to_i)
}

## read user list ##
user_list = Array.new
File.open('../input/user_list.mat').each_line { |line|
	user_list.push(line.to_i)
}

## read movie user pair ##
movie_set = {}
File.open('../input/movie_user.mat').each_line { |line|
	words = line.split(' ')
	movieID = words[0].to_i
	userID = words[1].to_i
	rating = words[2].to_i
	
	if movie_set.has_key?(movieID)
		user_rating = movie_set[movieID]
		user_rating[userID] = rating
		movie_set[movieID] = user_rating
	elsif
		user_rating = Hash.new
		user_rating[userID] = rating
		movie_set[movieID] = user_rating
	end
}

## write matrix ##
matrix_output = File.open('../input/matrix.mat', 'w')

movie_list.each do |movieID|
	line_text = ""
	user_rating = movie_set[movieID]
	user_list.each do |userID|
		if !user_rating.has_key?(userID) 
			line_text = line_text + "0 "
		elsif
			line_text = line_text + user_rating[userID].to_s + " "
		end
	end

	line_text = line_text + "\n"
	puts line_text
	matrix_output.write(line_text)
end

matrix_output.close()
