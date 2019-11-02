class Genre < ApplicationRecord
    has_many :books, through: :genre_books

    def self.popular_genres
        select { |g| g.genre_books.count >= 5 }
    end
end
