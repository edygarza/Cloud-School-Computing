class AddPackageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :package_id, :integer
  end
end
