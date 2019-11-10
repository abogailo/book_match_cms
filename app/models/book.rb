class Book < ApplicationRecord
    has_many :reviews, dependent: :destroy
   
    has_many :genre_books
    has_many :genres, through: :genre_books

    has_many :favorites, dependent: :destroy
    has_many :books_favorited, through: :favorites, source: :user


    def genres_attributes=(genre_attributes)
        genre_attributes.values.each do |genre_attribute|
            if !genre_attribute[:name].blank?
                genre = Genre.find_or_create_by(genre_attribute)
                self.genres << genre
            end
        end
    end

    def authors_attributes=(author_attributes)
        @author = Author.find_or_create_by(name: author_attributes[:name]) unless author_attributes[:name].blank?
    end

end
