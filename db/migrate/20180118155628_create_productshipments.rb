class CreateProductshipments < ActiveRecord::Migration[5.1]
  def change
    create_table :productshipments do |t|

      t.decimal :height, precision: 5, scale: 2
      t.decimal :weight, precision: 5, scale: 2
      t.decimal :width, precision: 5, scale: 2
      t.decimal :depth, precision: 5, scale: 2

      t.timestamps
    end
  end
end
