require './movie_user'
# Author hhua.dev@gmail.com

#movie_user = Array.new 
movie_count = 0
movie_file = '../input/movie_user.mat'

movie_output = File.open(movie_file, 'w')

Dir.glob('../training_set/*.txt') do |file|
	# read every file in the training set
	puts "working on: " + file + "\n"

	movieID = 0
	movie_count = movie_count + 1

	File.open(file).each_line { |line|
		words = line.split(',')

		if words.length == 1 
			movieID = words[0].to_i
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

