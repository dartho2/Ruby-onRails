class CreateMagazines < ActiveRecord::Migration[5.1]
  def change
    create_table :magazines do |t|
      t.reference :product, foreign_key: true
      t.integer :quantity
      t.string :productname
      t.timestamps
    end
  end
end
