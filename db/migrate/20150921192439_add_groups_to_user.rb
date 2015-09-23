class AddGroupsToUser < ActiveRecord::Migration
  def change
    add_column :users, :vk_group, :string, limit: 255
    add_column :users, :fb_group, :string, limit: 255
  end
end
