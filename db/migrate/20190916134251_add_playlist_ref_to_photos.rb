# frozen_string_literal: true

class AddPlaylistRefToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_reference :photos, :playlist, null: false, foreign_key: true
  end
end
