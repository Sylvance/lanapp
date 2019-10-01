# frozen_string_literal: true

class Course < ApplicationRecord
  resourcify
  belongs_to :user

  has_many :playlists, dependent: :destroy
  has_one_attached :banner, dependent: :destroy

  validates :title, presence: true, uniqueness: true

  scope :by_date, -> { order(created_at: :desc) }

  # pagination
  self.per_page = 10

  def is_free?
    price.zero?
  end
end
