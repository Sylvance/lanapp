class User < ApplicationRecord
    has_secure_password
    has_one_attached :avatar
    has_many :videos, dependent: :destroy
    has_many :photos, dependent: :destroy
    has_many :playlists, dependent: :destroy

    validates :name, presence: true, format: /\A[0-9a-zA-Z_\-\.]{6,}\z/
    validates :password, presence: true, format: /\A[^ ]{6,}\z/
    validates :email, presence: true, format: /\A[a-zA-Z0-9_\-\.]+@(([a-zA-Z]+\.[a-zA-Z]+)|(([0-9]\.){3}[0-9]))\z/, uniqueness: true
end
