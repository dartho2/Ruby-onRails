class Magazine < ApplicationRecord
  has_many :products

  after_save :add_product_list


  # jesli product_id! magazyn tworzy produkt  i ustawia poczatkowe parent_id 0
  # przypisuje product_id do magazynu
  def add_product_list
    if !self.product_id
      product = Product.create(:name => self.productname, :parent_id => false )
      product.save(:validate => false)
      self.update_columns(product_id: product.id)
    end
  end
end
