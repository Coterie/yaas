class RemoveRepliedAtToPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :replied_at
      end

  def down
    add_column :posts, :replied_at, :datetime
  end
end
