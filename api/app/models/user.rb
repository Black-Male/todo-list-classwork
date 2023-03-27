class User < ApplicationRecord
    has_secure_password
    has_many :todos
    
    validates :username, {
        length: {minimum: 8, maximum: 16},
        uniqueness: true,
        presence: true
    }

    validates :email, {
        uniqueness: true,
        presence: true
    }
end
