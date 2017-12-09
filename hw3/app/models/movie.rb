class Movie < ActiveRecord::Base
    
    def self.ratings
        rating = Set.new
        Movie.all.each do |movie|
            rating.add(movie.rating)
        end
        return rating.to_a.sort
    end
end
