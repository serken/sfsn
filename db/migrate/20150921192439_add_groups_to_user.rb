class AddGroupsToUser < ActiveRecord::Migration
  def change
    add_column :users, :vk_group_id, :integer, limit: 5
    add_column :users, :fb_group_id, :integer, limit: 5
  end
end
