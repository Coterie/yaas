class AddRepliedAtToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :replied_at, :datetime

  end
end
