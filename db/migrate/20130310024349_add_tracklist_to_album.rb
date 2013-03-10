class AddTracklistToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :tracklist, :string
  end
end
