class CourseSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :banner
  has_one :user
  has_many :playlists
end
