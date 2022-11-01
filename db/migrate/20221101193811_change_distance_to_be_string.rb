class ChangeDistanceToBeString < ActiveRecord::Migration[7.0]
  def change
    change_column :parcels, :distance, :string
  end
end
