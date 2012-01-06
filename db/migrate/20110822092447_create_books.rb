class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.references :author
      t.string :name
      t.string :subject
      t.integer :pages
      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
