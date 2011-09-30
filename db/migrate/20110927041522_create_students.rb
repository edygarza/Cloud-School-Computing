class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.integer :school_id
      t.string :registration_number
      t.string :first_name
      t.string :last_name
      t.integer :semester
      t.date :entry_date
      t.string :tutor
      t.string :tutor_address
      t.string :tutor_phone
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
