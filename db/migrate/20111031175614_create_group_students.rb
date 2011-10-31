class CreateGroupStudents < ActiveRecord::Migration
  def self.up
    create_table :group_students do |t|
      t.integer :group_id
      t.integer :student_id
      t.timestamps
    end
  end

  def self.down
    drop_table :group_students
  end
end
