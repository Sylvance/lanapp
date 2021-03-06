# frozen_string_literal: true

class Video < ApplicationRecord
  resourcify
  belongs_to :user
  belongs_to :playlist

  has_one_attached :content, dependent: :destroy

  validates :title, presence: true

  scope :by_date, -> { order(created_at: :desc) }

  redi_search schema: {
    title: { text: { phonetic: "dm:en" } }
  }

  # pagination
  self.per_page = 10

  def is_free?
    playlist = Playlist.find(playlist_id)
    course = Course.find(playlist.course_id)
    course.price.zero?
  end
end
