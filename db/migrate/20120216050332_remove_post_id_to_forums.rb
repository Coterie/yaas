class RemovePostIdToForums < ActiveRecord::Migration
  def up
    remove_column :forums, :post_id
      end

  def down
    add_column :forums, :post_id, :integer
  end
end
