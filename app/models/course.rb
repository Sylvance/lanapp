class Course < ApplicationRecord
  belongs_to :user

  has_many :playlists

  validates :title, presence: true, uniqueness: true
end
