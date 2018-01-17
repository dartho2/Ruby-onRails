class AddAdressToAdminsDevices < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :zip, :string
    add_column :admins, :street, :string
    add_column :admins, :number, :string
    add_column :admins, :nip, :string
    add_column :admins, :phone, :string
    add_column :admins, :fullname, :string
    add_column :admins, :city, :string

  end
end
