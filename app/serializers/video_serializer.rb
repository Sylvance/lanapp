class VideoSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :content
  has_one :user
  has_one :playlist
end
