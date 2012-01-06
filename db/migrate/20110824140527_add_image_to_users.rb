class AddImageToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :image, :blob
  end

  def self.down
    remove_column :users, :image
  end
end
