class CreateMagazineInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :magazine_invoices do |t|
      t.references :magazine, foreign_key: true
      t.references :invoice, foreign_key: true
      t.string :name
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :quantity
    end
  end
end
