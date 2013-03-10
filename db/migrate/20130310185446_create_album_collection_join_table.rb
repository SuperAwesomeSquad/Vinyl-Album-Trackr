class CreateAlbumCollectionJoinTable < ActiveRecord::Migration
  def change
    create_table :albums_collections, :id => false do |t|
      t.integer :album_id
      t.integer :collection_id
    end
  end
end
