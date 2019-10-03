# frozen_string_literal: true

class Course < ApplicationRecord
  include Filterable

  resourcify
  belongs_to :user

  has_many :playlists, dependent: :destroy
  has_one_attached :banner, dependent: :destroy

  validates :title, presence: true, uniqueness: true

  scope :by_date, -> { order(created_at: :desc) }
  scope :by_recent, (order) -> { search.order(created_at: order) }
  scope :by_price_range, -> (range) { where(price: range[0]..range[1]).results }

  redi_search schema: {
    title: { text: { phonetic: "dm:en" } }
  }

  # pagination
  self.per_page = 10

  def is_free?
    price.zero?
  end
end
