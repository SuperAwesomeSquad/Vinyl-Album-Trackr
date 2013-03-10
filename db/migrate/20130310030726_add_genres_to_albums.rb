class AddGenresToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :genres, :text
    add_column :albums, :tracklist, :text
    add_column :albums, :artists, :text
  end
end
