class RemoveUserIdFromAlbums < ActiveRecord::Migration
  def up
    remove_column :albums, :user_id
  end

  def down
    add_column :albums, :user_id, :integer
  end
end
