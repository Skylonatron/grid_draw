class AddSquaresColumnToGrid < ActiveRecord::Migration[5.1]
  def change
    add_column :grids, :squares, :text
    add_column :grids, :tunnel_status, :integer, default: 0
  end
end
