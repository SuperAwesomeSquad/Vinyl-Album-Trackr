class RemoveUseridFromCollections < ActiveRecord::Migration
  def up
    remove_column :collections, :user_id
  end

  def down
    add_column :collections, :user_id, :integer
  end

  remove_index :collections, :user_id
end
