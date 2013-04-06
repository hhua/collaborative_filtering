user_movie = [];
user_map = [];
movie_map = [];
movies = [];
users = [];
user_map_query = [];
movie_map_query = [];
load('matlabdata/user_movie.mat');
load('matlabdata/user_map.mat');
load('matlabdata/movie_map.mat');
load('matlabdata/query_users.mat');
load('matlabdata/query_movies.mat');
load('matlabdata/user_map_query.mat');
load('matlabdata/movie_map_query.mat');

% read user ratings for each movie %
user_query_ratings = user_movie(:, user_map_query');

% calculate similarity between each users %
times = (user_query_ratings').*user_movie % k * m
mod_times = (sqrt(sum(user_query_ratings.^2)))' .* sqrt(sum(user_movie.^2)) % k * m
similarity = times ./ mod_times % k * m

% remove Inf and NaN
similarity(isnan(similarity)) = 0
similarity(isinf(similarity)) = 0

sort(similarity, 2) % k * m

% knn %






