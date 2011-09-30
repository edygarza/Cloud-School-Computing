class CreateSubjects < ActiveRecord::Migration
  def self.up
    create_table :subjects do |t|
      t.integer :school_id
      t.string :key
      t.string :name
      t.integer :units
      t.timestamps
    end
  end

  def self.down
    drop_table :subjects
  end
end
