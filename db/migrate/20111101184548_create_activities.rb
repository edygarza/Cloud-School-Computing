class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.string :group_id
      t.string :title
      t.integer :value
      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
