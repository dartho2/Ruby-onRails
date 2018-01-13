class AddRefProductStructuresToMagazines < ActiveRecord::Migration[5.1]
  def change
    add_references :product_structures, :magazine, foreign_key: true

  end
end
