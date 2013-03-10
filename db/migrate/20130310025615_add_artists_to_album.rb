class AddArtistsToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :artists, :string
  end
end
