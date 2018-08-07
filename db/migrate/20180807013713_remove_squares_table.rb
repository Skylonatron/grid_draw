class RemoveSquaresTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :squares
  end
end
