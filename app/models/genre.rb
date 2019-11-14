class Genre < ApplicationRecord
    validates :name, presence: true
    has_many :genre_books
    has_many :books, through: :genre_books
    
    def self.popular_genres
        select { |g| g.genre_books.count >= 3 }
    end
end
