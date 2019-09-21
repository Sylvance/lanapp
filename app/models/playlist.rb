class Playlist < ApplicationRecord
  belongs_to :user

  has_many :videos, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_one_attached :banner

  validates :title, presence: true, uniqueness: true
end
