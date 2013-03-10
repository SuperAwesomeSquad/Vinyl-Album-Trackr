class RemoveUserIdFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :user_id
  end

  def down
    add_column :users, :user_id, :integer
  end
end
