class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :banner
  has_one :user
  has_many :videos
  has_many :photos
end
