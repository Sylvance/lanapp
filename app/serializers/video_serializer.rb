class VideoSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :content
  has_one :user
end
