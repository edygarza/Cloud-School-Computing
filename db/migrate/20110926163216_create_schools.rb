class CreateSchools < ActiveRecord::Migration
  def self.up
    create_table :schools do |t|
      t.integer :owner_id
      t.string :name
      t.text :description
      t.string :street_name
      t.string :street_number
      t.string :district
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.string :telephone
      t.timestamps
    end
  end

  def self.down
    drop_table :schools
  end
end
