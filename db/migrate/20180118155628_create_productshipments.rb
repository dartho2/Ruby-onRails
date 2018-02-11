class CreateProductshipments < ActiveRecord::Migration[5.1]
  def change
    create_table :productshipments do |t|

      t.decimal :height, :precision => 8, :scale => 2
      t.decimal :weight, :precision => 8, :scale => 2
      t.decimal :width, :precision => 8, :scale => 2
      t.decimal :depth, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
