class Review < ApplicationRecord
    validates :review, presence: true
    belongs_to :book
    belongs_to :user
    accepts_nested_attributes_for :book

    scope :recent, ->(reviews) { order('created_at DESC').limit(reviews) }
end
