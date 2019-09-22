# frozen_string_literal: true

class VideoSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :description, :content_url
  has_one :user
  has_one :playlist

  def content_url
    rails_blob_path(object.content, only_path: true) if object.content.present?
  end
end
