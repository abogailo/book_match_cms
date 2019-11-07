class Book < ApplicationRecord
    belongs_to :cart
    has_many :reviews, dependent: :destroy
   
    has_many :genre_books
    has_many :genres, through: :genre_books

    accepts_nested_attributes_for :author

    def genres_attributes=(genre_attributes)
        genre_attributes.values.each do |genre_attribute|
            if !genre_attribute[:name].blank?
                genre = Genre.find_or_create_by(genre_attribute)
                self.genres << genre
            end
        end
    end

    def authors_attributes=(author_attributes)
        self.author = Author.find_or_create_by(name: author_attributes[:name]) unless author_attributes[:name].blank?
    end

    # creates a new heart row with post_id and user_id
    def add_to_cart!(book)
        self.cart_books.create!(book_id: book.id)
    end
  
    # destroys a heart with matching post_id and user_id
    def remove_from_cart!(book)
        cart_books = find_by_book_id(post.id)
        cart_books.destroy!
    end
  
    # returns true of false if a post is hearted by user
    def in_cart?(book)
    end

end
