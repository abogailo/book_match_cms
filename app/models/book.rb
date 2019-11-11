class Book < ApplicationRecord
    has_one :author
    has_many :reviews, dependent: :destroy

    has_many :genre_books
    has_many :genres, through: :genre_books

    has_many :favorites, dependent: :destroy
    has_many :books_favorited, through: :favorites, source: :user
    #add find and create by in this model, issue getting params in model, issue getting name of author to change to author id. perhaps call this method
#https://stackoverflow.com/questions/3579924/accepts-nested-attributes-for-with-find-or-create/
#try referencing this again

    def genres_attributes=(genre_attributes)
        genre_attributes.values.each do |genre_attribute|
            if !genre_attribute[:name].blank?
                genre = Genre.find_or_create_by(genre_attribute)
                self.genres << genre
            end
        end
    end
end
