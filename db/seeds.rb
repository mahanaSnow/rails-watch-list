require 'json'
require 'open-uri'

url = 'http://tmdb.lewagon.com/movie/top_rated'
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

movies['results'].each do |movie|
  title = movie['title']
  overview = movie['overview']
  poster_url = "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"
  rating = movie['vote_average']
  Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)
end
