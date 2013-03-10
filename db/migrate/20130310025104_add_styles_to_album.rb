class AddStylesToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :styles, :string
  end
end
