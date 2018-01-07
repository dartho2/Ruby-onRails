class ProductOrder < ApplicationRecord
  belongs_to :order, inverse_of: :product_orders
  belongs_to :product, inverse_of:  :product_orders

  validates :quantity, presence: true

  accepts_nested_attributes_for :product, allow_destroy: true

  def product_attributes=(attributes)
    if attributes['id'].present?
      self.product = Product.find(attributes['id'])
    end
    super
  end

end
