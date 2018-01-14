class Magazine < ApplicationRecord
  has_many :products
  has_many :product_structures, :foreign_key => "product_id"
  after_save :add_product_list
  accepts_nested_attributes_for :product_structures

  def add_product_list
    if !self.product_id
      product = Product.create(:name => self.productname, :parent_id => false)
      product.save(:validate => false)
      self.update_columns(product_id: product.id)
    end
  end
end
