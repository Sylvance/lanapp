class User < ApplicationRecord
    has_secure_password
    has_many :videos
    has_many :photos
end
