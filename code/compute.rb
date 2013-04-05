movie_file = '../input/movie_user.mat'

# total stats
sum_rating = 0
num_entry = 0
num_ones = 0
num_threes = 0
num_fives = 0

# stats for user ID 1234576
usr_movies = 0
usr_ones = 0
usr_threes = 0
usr_fives = 0
usr_rating = 0

# stats for movie ID 4321
movie_usrs = 0
movie_ones = 0
movie_threes = 0
movie_fives = 0
movie_rating = 0

File.open(movie_file).each_line { |line|
	words = line.split(' ')	
	usrID = words[1].to_i
	movieID = words[0].to_i
	rating = words[2].to_f

	num_entry = num_entry + 1
	sum_rating = sum_rating + rating
	
	if rating == 1
		num_ones = num_ones + 1
	elsif rating == 3
		num_threes = num_threes + 1
	elsif rating == 5
		num_fives = num_fives + 1
	end

	if usrID == 1234576
		usr_movies = usr_movies + 1
		usr_rating = usr_rating + rating

		if rating == 1
			usr_ones = usr_ones + 1
		elsif rating == 3
			usr_threes = usr_threes + 1
		elsif rating == 5
			usr_fives = usr_fives + 1
		end
	end

	if movieID == 4321
		movie_usrs = movie_usrs + 1
		movie_rating = movie_rating + rating

		if rating == 1
			movie_ones = movie_ones + 1
		elsif rating == 3
			movie_threes = movie_threes + 1
		elsif rating == 5
			movie_fives = movie_fives + 1
		end
	end
}

## print stats
puts "the number of times with rating '1': %d \n" % num_ones
puts "the number of times with rating '3': %d \n" % num_threes
puts "the number of times with rating '5': %d \n" % num_fives
puts "average movie rating: %f \n" % (sum_rating / num_entry)

puts "the number of movies rated by userID 1234576: %d \n" % usr_movies
puts "the number of times the user gave a '1' rating by userID 1234576: %d \n" % usr_ones
puts "the number of times the user gave a '3' rating by userID 1234576: %d \n" % usr_threes
puts "the number of times the user gave a '5' rating by userID 1234576: %d \n" % usr_fives
puts "the average movie rating for this user by userID 1234576: %f \n" % (usr_rating / usr_movies)

puts "the number of users rating this movie ID 4321: %d \n" % movie_usrs
puts "the number of times the movie ID 4321 was rated '1': %d \n" % movie_ones
puts "the number of times the movie ID 4321 was rated '3': %d \n" % movie_threes
puts "the number of times the movie ID 4321 was rated '5': %d \n" % movie_fives
puts "the average rating for this movie ID 4321: %f" % (movie_rating / movie_usrs)
