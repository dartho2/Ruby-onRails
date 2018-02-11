class CreateProductshipments < ActiveRecord::Migration[5.1]
  def change
    create_table :productshipments do |t|

      t.integer :height
      t.integer :weight
      t.integer :width
      t.integer :depth

      t.timestamps
    end
  end
end
