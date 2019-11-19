class Author < ApplicationRecord
    default_scope { order("name ASC")}
    validates :name, presence: true
    has_many :books
end
