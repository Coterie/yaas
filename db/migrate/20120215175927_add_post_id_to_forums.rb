class AddPostIdToForums < ActiveRecord::Migration
  def change
    add_column :forums, :post_id, :integer

  end
end
