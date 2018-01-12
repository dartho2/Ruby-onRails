class CreateProductStructures < ActiveRecord::Migration[5.1]
  def change
    create_table :product_structures do |t|
      t.string :label
      t.timestamps
    end
  end
end
