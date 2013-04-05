require './movie_user'
# Author hhua.dev@gmail.com

#movie_user = Array.new 
movie_count = 0
movie_file = '../input/movie_user.mat'


## movie_user pairs ##
######################
movie_output = File.open(movie_file, 'w')
movie_list_output = File.open('../input/movie_list.mat', 'w')

Dir.glob('../training_set/*.txt') do |file|
	# read every file in the training set

	movieID = 0
	movie_count = movie_count + 1

	File.open(file).each_line { |line|
		words = line.split(',')

		if words.length == 1 
			movieID = words[0].to_i
			movie_list_output.write(movieID.to_s + "\n")
		elsif words.length >= 2
			#movie = Movie.new(movieID, words[0], words[1])	
			#movie_user.push(movie)
			movie_output.write(movieID.to_s + " " + words[0] + " " + words[1] + "\n")
		end
	}
end

puts "Total number of movies is %d" % movie_count
#puts movie_user.length

movie_output.close()
movie_list_output.close()

## user_movie pairs ##
######################

user_file = '../input/user_movie.mat'
user_count = 0

user_movie = {}

user_output = File.open(user_file, 'w')

File.open(movie_file).each_line { |line|
	words = line.split(' ')

	user_movie[words[1]] = "0"

	user_output.write(words[1] + " " + words[0] + " " + words[2] + "\n")
}

user_output.close()

puts "Total number of users is %d" % user_movie.length

## write user list ##
#####################
user_list_output = File.open('../input/user_list.mat', 'w')
user_movie.keys.each do |key|
	user_list_output.write(key + "\n")
end

user_list_output.close()

