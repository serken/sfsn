class AddVkTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :vk_token, :string
  end
end
