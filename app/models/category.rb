class Category < ApplicationRecord
    has_many :books, through: :category_books, source: :book
end
