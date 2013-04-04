class User 
	
	def initialize(userID, movieID, rating)
		@movieID = movieID
		@userID = userID
		@rating = rating
	end

	attr_accessor :movieID
	attr_accessor :userID
	attr_accessor :rating
end
