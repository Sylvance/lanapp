class Video < ApplicationRecord
  belongs_to :user
  belongs_to :playlist

  has_one_attached :content

  validates :title, presence: true
end
