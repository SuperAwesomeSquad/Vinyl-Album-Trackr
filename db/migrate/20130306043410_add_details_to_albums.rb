class AddDetailsToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :discogs_id, :integer
  end
end
