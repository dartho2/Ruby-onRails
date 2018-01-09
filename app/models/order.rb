class Order < ApplicationRecord
  has_many :product_orders, inverse_of: :order
  has_many :products, :through => :product_orders, inverse_of: :orders

  accepts_nested_attributes_for :product_orders, allow_destroy: true



validates :name, presence: true

  def total_price
    @total_price ||= product_orders.includes(:product).reduce(0) do |sum, a|
      sum + (a.quantity * a.price)
    end
  end

end
