class AddAdress < ActiveRecord::Migration[5.1]
  def change
      add_column :adresses, :zip, :string
      add_column :adresses, :street, :string
      add_column :adresses, :number, :string
      add_column :adresses, :phone, :string
      add_column :adresses, :company_zip, :string
      add_column :adresses, :company_city, :string
      add_column :adresses, :company_street, :string
      add_column :adresses, :company_number, :string
      add_column :adresses, :company_nip, :string

  end
end
