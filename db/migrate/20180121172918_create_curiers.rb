class CreateCuriers < ActiveRecord::Migration[5.1]
  def change
    create_table :curiers do |t|
      t.string :label
      t.decimal :maxweight, precision: 5, scale: 2
      t.decimal :minweight, precision: 5, scale: 2
      t.decimal :price, precision: 8, scale: 2
      t.timestamps
    end
  end
end
