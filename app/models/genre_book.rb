class GenreBook < ApplicationRecord
    attr_accessor :genre_ids
    belongs_to :book 
    belongs_to :genre
    
end
