class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :bio
  has_many :videos
  has_many :photos
end
