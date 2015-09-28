class RemoveGroupsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :vk_group
    remove_column :users, :fb_group
  end
end
