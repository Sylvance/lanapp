# frozen_string_literal: true

class AddPlaylistRefToVideos < ActiveRecord::Migration[6.0]
  def change
    add_reference :videos, :playlist, null: false, foreign_key: true
  end
end
