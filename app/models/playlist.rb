# frozen_string_literal: true

class Playlist < ApplicationRecord
  resourcify
  belongs_to :user

  has_many :videos, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_one_attached :banner, dependent: :destroy

  validates :title, presence: true, uniqueness: true

  scope :by_date, -> { order(created_at: :desc) }

  redi_search schema: {
    title: { text: { phonetic: "dm:en" } }
  }

  # pagination
  self.per_page = 10

  def is_free?
    course = Course.find(course_id)
    course.price.zero?
  end
end
