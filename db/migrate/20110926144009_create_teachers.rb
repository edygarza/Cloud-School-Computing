class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.integer :account_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :telephone

      t.timestamps
    end
  end
end
