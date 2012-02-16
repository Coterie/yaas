class AddRepliedAtToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :replied_at, :datetime

  end
end
