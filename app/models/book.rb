class Book < ApplicationRecord
    has_many :categories, through: :category_books, source: :category
    has_many :genres, through: :genre_books
    has_many :reviews, dependent: :destroy
end
