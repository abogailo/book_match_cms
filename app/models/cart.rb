class Cart < ApplicationRecord
    belongs_to :user
    has_many :cart_books, dependent: :destroy
    has_many :books, through: cart_books
end
