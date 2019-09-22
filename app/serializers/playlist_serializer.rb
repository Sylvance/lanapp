class PlaylistSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :description, :banner_url
  has_one :user
  has_many :videos
  has_many :photos

  def banner_url
    rails_blob_path(object.banner, only_path: true) if object.banner.present?
  end
end
