class AddAdditionalAttributesToUser < ActiveRecord::Migration
  def up
    add_column :users, :profile_image_url, :string
    add_column :users, :nickname, :string
  end

  def down
    remove_column :users, :profile_image_url
    remove_column :users, :nickname
  end
end
