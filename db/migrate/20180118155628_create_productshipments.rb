class CreateProductshipments < ActiveRecord::Migration[5.1]
  def change
    create_table :productshipments do |t|
      t.string :height
      t.string :weight
      t.string :width
      t.string :depth

      t.timestamps
    end
  end
end
