class CreateProductshipments < ActiveRecord::Migration[5.1]
  def change
    create_table :productshipments do |t|

      t.timestamps
    end
  end
end
