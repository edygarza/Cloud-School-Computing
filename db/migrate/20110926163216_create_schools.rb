class CreateSchools < ActiveRecord::Migration
  def self.up
    create_table :schools do |t|
      t.integer :owner_id
      t.string :name
      t.text :description
      t.text :street_name
      t.text :street_number
      t.text :district
      t.text :city
      t.text :state
      t.integer :zip_code
      t.text :country
      t.string :telephone
      t.timestamps
    end
  end

  def self.down
    drop_table :schools
  end
end
