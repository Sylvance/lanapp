# frozen_string_literal: true

class Course < ApplicationRecord
  resourcify
  belongs_to :user

  has_many :playlists, dependent: :destroy
  has_one_attached :banner

  validates :title, presence: true, uniqueness: true

  def is_free?
    price.zero?
  end
end
