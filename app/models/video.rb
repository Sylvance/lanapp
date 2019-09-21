class Video < ApplicationRecord
  resourcify
  belongs_to :user
  belongs_to :playlist

  has_one_attached :content

  validates :title, presence: true

  def is_free?
    playlist = Playlist.find(playlist_id)
    course = Course.find(playlist.course_id)
    course.price.zero?
  end
end
