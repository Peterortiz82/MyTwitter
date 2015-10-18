class AddAttributesToUser < ActiveRecord::Migration
  def up
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string
    add_column :users, :location, :string
    add_column :users, :image, :string
    add_column :users, :description, :string
    add_column :users, :token, :string
    add_column :users, :secret, :string
  end

  def down
    remove_column :users, :provider
    remove_column :users, :uid
    remove_column :users, :name
    remove_column :users, :location
    remove_column :users, :image
    remove_column :users, :description
    remove_column :users, :token
    remove_column :users, :secret
  end
end
