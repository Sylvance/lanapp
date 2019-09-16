class AddCourseRefToPlaylist < ActiveRecord::Migration[6.0]
  def change
    add_reference :playlists, :course, null: false, foreign_key: true
  end
end
