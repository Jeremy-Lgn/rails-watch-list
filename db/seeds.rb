require "json"
require "open-uri"

List.destroy_all
Movie.destroy_all


# movie1 = Movie.create!(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# movie2 = Movie.create!(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# movie3 = Movie.create!(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# movie4 = Movie.create!(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)


# list = List.create!(name: "My custom List")

# Bookmark.create!(comment: "Niceuuu", movie: movie1, list: list)
# Bookmark.create!(comment: "Bien aussi", movie: movie2, list: list)


url = "https://tmdb.lewagon.com/movie/top_rated"
data_serialized = URI.parse(url).read
data = JSON.parse(data_serialized)

data["results"].each do |movie|
  poster_url = "https://image.tmdb.org/t/p/w500/#{movie["poster_path"]}"

  Movie.create!(title: movie["original_title"], overview: movie["overview"], poster_url: poster_url, rating: movie["vote_average"])
end
