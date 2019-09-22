# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :email, :bio, :avatar_url
  has_many :playlists
  has_many :videos
  has_many :photos

  def avatar_url
    rails_blob_path(object.avatar, only_path: true) if object.avatar.present?
  end
end
