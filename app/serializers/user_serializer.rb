class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :bio
end
