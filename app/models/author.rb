class Author < ApplicationRecord
    validates :name, presence: true
    has_many :author_books
    has_many :books, through: :author_books
end
