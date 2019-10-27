class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, uniqueness:true
    validates :name, presence: true
    
    has_many :books
    has_many :reviews

    def self.find_or_create_by_omniauth(auth_hash)
        # Creates a new user only if it doesn't exist
        self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
            user.password = SecureRandom.hex
        end
    end
end
