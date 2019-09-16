class Video < ApplicationRecord
  belongs_to :user
  belongs_to :playlist

  validates :title, presence: true
end
