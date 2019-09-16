class User < ApplicationRecord
    has_secure_password
    has_many :videos
    has_many :photos

    validates :name, presence: true, format: /\A[0-9a-zA-Z_\-\.]{6,}\z/
    validates :password, presence: true, format: /\A[^ ]{6,}\z/
    validates :email, presence: true, format: /\A[a-zA-Z0-9_\-\.]+@(([a-zA-Z]+\.[a-zA-Z]+)|(([0-9]\.){3}[0-9]))\z/, uniqueness: true
end
