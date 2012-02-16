class CreateMonitorships < ActiveRecord::Migration
  def change
    create_table :monitorships do |t|
      t.integer :topic_id
      t.integer :user_id
      t.boolean :active , default: true 

      t.timestamps
    end
  end
end
