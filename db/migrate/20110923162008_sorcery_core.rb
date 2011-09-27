class SorceryCore < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.integer :school_id
      t.string :username,         :null => false  # if you use another filed as a username, for example email, you can safely remove this field.
      t.string :email,            :default => nil # if you use this field as a username, you might want to make it :null => false
      t.string :first_name
      t.string :last_name
      t.string :home_phone
      t.string :office_phone
      t.string :cell_phone
      t.text :address
      t.boolean :admin, 	  :default => false
      t.boolean :director,        :default => false
      t.boolean :assistant,	  :default => false
      t.boolean :teacher,	  :default => false
      t.string :crypted_password, :default => nil
      t.string :salt,             :default => nil

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
