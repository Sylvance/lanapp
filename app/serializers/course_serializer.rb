# frozen_string_literal: true

class CourseSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :description, :banner_url
  has_one :user
  has_many :playlists

  def banner_url
    rails_blob_path(object.banner, only_path: true) if object.banner.present?
  end
end
