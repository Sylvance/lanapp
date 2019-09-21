class Course < ApplicationRecord
  belongs_to :user

  has_many :playlists, dependent: :destroy
  has_one_attached :banner

  validates :title, presence: true, uniqueness: true
end
