class Book < ApplicationRecord
    has_many :reviews, dependent: :destroy

    has_many :genre_books
    has_many :genres, through: :genre_books
    #accepts_nested_attributes_for :genres

    def genres_attributes=(genre_attributes)
        genre_attributes.values.each do |genre_attribute|
            if !genre_attribute[:name].blank?
                genre = Genre.find_or_create_by(genre_attribute)
                self.genres << genre
            end
        end
    end
    
end
