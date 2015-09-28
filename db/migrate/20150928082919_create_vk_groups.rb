class CreateVkGroups < ActiveRecord::Migration
  def change
    create_table :vk_groups do |t|
      t.string :name
      t.datetime :last_message_time
      t.integer :user_id
    end
  end
end
