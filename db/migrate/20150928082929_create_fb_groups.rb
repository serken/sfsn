class CreateFbGroups < ActiveRecord::Migration
  def change
    create_table :fb_groups do |t|
      t.string :name
      t.datetime :last_message_time
      t.integer :user_id
    end
  end
end
