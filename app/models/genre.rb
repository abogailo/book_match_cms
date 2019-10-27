class Genre < ApplicationRecord
    has_many :genre_books through: :genre_book, source: :book
end
