class Genre < ApplicationRecord
    validates :name, presence: true
    has_many :genre_books
    has_many :books, through: :genre_books
    
end
