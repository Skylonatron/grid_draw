class CreateSquares < ActiveRecord::Migration[5.1]
  def change
    create_table :squares do |t|
      t.string :color
      t.integer :x
      t.integer :y
      t.integer :grid_id
      t.timestamps
    end
  end
end
