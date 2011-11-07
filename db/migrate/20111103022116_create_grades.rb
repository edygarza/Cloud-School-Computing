class CreateGrades < ActiveRecord::Migration
  def self.up
    create_table :grades do |t|
      t.integer :student_id
      t.integer :activity_id
      t.decimal :grade
      t.timestamps
    end
  end

  def self.down
    drop_table :grades
  end
end
