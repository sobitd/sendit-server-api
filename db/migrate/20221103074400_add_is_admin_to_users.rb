class AddIsAdminToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :isAdmin, :integer
  end
end
