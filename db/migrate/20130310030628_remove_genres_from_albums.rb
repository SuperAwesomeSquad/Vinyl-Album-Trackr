class RemoveGenresFromAlbums < ActiveRecord::Migration
  def up
    remove_column :albums, :genres
    remove_column :albums, :tracklist
    remove_column :albums, :artists
  end

  def down
    add_column :albums, :artists, :string
    add_column :albums, :tracklist, :string
    add_column :albums, :genres, :string
  end
end
