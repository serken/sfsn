class AddVkIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :vk_id, :integer
  end
end
