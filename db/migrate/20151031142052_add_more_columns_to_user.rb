class AddMoreColumnsToUser < ActiveRecord::Migration
  def up
    add_column :users, :followers_count, :integer
    add_column :users, :statuses_count, :integer
    add_column :users, :friends_count, :integer
  end

  def down
    remove_column :users, :followers_count
    remove_column :users, :statuses_count
    remove_column :users, :friends_count
  end
end
