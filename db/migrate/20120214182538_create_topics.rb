class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :id
      t.string :title
      t.integer :forum_id
      t.integer :user_id

      t.timestamps
    end
      add_index :topics , :forum_id
      add_index :topics , :user_id
  end
end
