class Review < ApplicationRecord
    validates :review, presence: true
    belongs_to :book

    scope :recent, ->(reviews) { order('created_at DESC').limit(reviews) }
end
