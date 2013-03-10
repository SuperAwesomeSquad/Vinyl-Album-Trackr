class RemoveArtistFromAlbum < ActiveRecord::Migration
  def up
    remove_column :albums, :artist
  end

  def down
    add_column :albums, :artist, :string
  end
end
