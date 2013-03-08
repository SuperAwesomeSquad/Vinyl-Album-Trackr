class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :name
      t.string :title
      t.string :artist
      t.integer :id

      t.timestamps
    end
  end
end
