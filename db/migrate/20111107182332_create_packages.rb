class CreatePackages < ActiveRecord::Migration
  def self.up
    create_table :packages do |t|
      t.string :name
      t.integer :users_limit
      t.integer :students_limit
      t.integer :groups_limit
      t.integer :subjects_limit
      t.timestamps
    end
  end

  def self.down
    drop_table :packages
  end
end
