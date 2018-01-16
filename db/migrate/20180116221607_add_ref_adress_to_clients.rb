class AddRefAdressToClients < ActiveRecord::Migration[5.1]
  def change
    add_reference :adresses, :client, foreign_key: true
  end
end
