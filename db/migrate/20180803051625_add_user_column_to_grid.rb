class AddUserColumnToGrid < ActiveRecord::Migration[5.1]
  def change
    add_column :grids, :device_key, :string
    add_column :grids, :user_id, :integer
  end
end
