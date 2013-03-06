class AddDetailsToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :discogs_id, :integer
    add_column :albums, :year, :integer
  end
end
