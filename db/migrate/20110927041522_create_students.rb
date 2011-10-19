class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.integer :school_id
      t.string :registration_number
      t.string :first_name
      t.string :last_name
      t.string :street_name
      t.string :street_number
      t.string :district
      t.string :city
      t.string :state
      t.string :country
      t.integer :semester
      t.date :entry_date
      t.string :tutor
      t.string :tutor_street_name
      t.string :tutor_street_number
      t.string :tutor_district
      t.string :tutor_city
      t.string :tutor_state
      t.string :tutor_country
      t.string :tutor_phone
      t.string :home_phone
      t.string :cell_phone
      t.text :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
