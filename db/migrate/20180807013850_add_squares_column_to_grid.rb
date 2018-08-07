class AddSquaresColumnToGrid < ActiveRecord::Migration[5.1]
  def change
    add_column :grids, :squares, :text
  end
end
