class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.integer :school_id
      t.string :registration_number
      t.string :first_name
      t.string :last_name
      t.string :father
      t.string :mother
      t.string :home_phone
      t.string :cell_phone
      t.text :address
      t.text :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
