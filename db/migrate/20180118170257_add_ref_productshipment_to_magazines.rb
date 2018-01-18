class AddRefProductshipmentToMagazines < ActiveRecord::Migration[5.1]
  def change
    add_reference :productshipments, :magazine, foreign_key: true
  end
end
