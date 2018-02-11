class CreateMagazineInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :magazine_invoices do |t|
      t.references :magazine, foreign_key: true
      t.references :invoice, foreign_key: true
      t.string :name
      t.integer :price
      t.integer :quantity
    end
  end
end
