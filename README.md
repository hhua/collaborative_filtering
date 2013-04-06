##Collaborative Filtering in Netflix Recommendation System
This is an assignment from 11-741 Information Retrieval, Carnegie Mellon University.

URL: <http://boston.lti.cs.cmu.edu/classes/11-741/HW/HW3/>

##Report - Corpus Exploration
Provide the following corpus statistics:
* the total number of movies: 5392
* the total number of users: 10916
* the number of times any movie was rated '1': 57887
* the number of times any movie was rated '3': 278902
* the number of times any movie was rated '5': 149542
* the average movie rating across all users and movies: 3.380294

For user ID 1234576, provide the following:
* the number of movies rated: 50
* the number of times the user gave a '1' rating: 1
* the number of times the user gave a '3' rating: 14
* the number of times the user gave a '5' rating: 7
* the average movie rating for this user: 3.56

For movie ID 4321, provide the following:
* the number of users rating this movie: 18
* the number of times the movie was rated '1': 2
* the number of times the movie was rated '3': 9
* the number of times the movie was rated '5': 2
* the average rating for this movie: 2.94

##The Experiments
Algorithms are based on the k-Nearest Neighbors (kNN) learning algorithm.

**Input**: a movie, user pair: p = (movieA, userA)

1. Find the k nearest-neighbors of p using a similarity metric of your choice. These neighbors will be a list of movie, user, rating triples: N={(m, u, r) | m = movie, u = user, r = rating in [1,5]}
2. Produce a prediction of the rating for p based on the neighbors N

**Output**: a rating r in the range [1,5]

For prediction step, there are two easy ways for predicting ratings:

* The mean rating for this movie among the neighbors, or
* The weighted mean rating for this movie among the neighbors, using the similarity measure from step (1) as the weight.

4 specific variations are required for this assignment:

* Find neighbors for step (1) by using a user-user similarity metric of your choice. Use the mean or weighted mean rating for step (2).
* Find neighbors for step (1) by using a movie-movie similarity metric of your choice. Use the mean or weighted mean rating for step (2).
* One of the above for step (1), but apply user-rating and/or movie-rating normalization for step (2).
* A custom algorithm of your choice. You may extend one of the above algorithms or come up with your own. 

## Implementation
As to similarity between neighbors, you may use dot, cos and PCC methods to calculate it. Here I implemented cos similarity for simplicity.

For normalization, 

* Initial Vector: x = (x1, ... , xn)
* Centering: avg x = 1/n * (x1+...+xn), x' = x - avg x
* Normalization: |x| = sqrt(sum((xj - avg x)^2)), z = x / |x|


Github Repo: <https://github.com/hhua/collaborative_filtering>
