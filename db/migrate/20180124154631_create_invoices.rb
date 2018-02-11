class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.string :name
      t.date :datatime
      t.timestamps
    end
  end
end
