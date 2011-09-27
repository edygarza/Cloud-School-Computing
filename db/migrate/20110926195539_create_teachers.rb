class CreateTeachers < ActiveRecord::Migration
  def self.up
    create_table :teachers do |t|
      t.integer :school_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :teachers
  end
end
