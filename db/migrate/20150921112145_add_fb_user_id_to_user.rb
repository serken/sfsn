class AddFbUserIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :fb_id, :long
  end
end
