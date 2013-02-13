class AddFieldsToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :year, :integer
    add_column :albums, :released, :datetime
    add_column :albums, :notes, :string
    add_column :albums, :labels, :string
    add_column :albums, :genres, :string
  end
end
