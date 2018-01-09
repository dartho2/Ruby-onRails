class Magazine < ApplicationRecord
  has_many :products

  after_save :add_product_list

  def add_product_list
    if !self.product_id
      product = Product.create(:name => self.productname)
      product.save(:validate => false)
      self.update_columns(product_id: product.id)
    end
  end
end
