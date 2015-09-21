class AddFiledsToUser < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string, limit: 16
  end
end
