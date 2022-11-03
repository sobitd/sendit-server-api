class RemoveIsAdminFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :isAdmin, :boolean
  end
end
