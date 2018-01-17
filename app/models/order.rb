class Order < ApplicationRecord
  has_many :product_orders, inverse_of: :order
  has_many :products, :through => :product_orders, inverse_of: :orders
  has_one :client
  has_one :adress, :through => :client
  before_create :data_change

  accepts_nested_attributes_for :product_orders, allow_destroy: true
  accepts_nested_attributes_for :client


  validates :name, presence: true

  def data_change
    debugger
    order = Order.last
    self.name = order.id.to_s + "/" + order.datatime.to_s


  end
  def total_price
    @total_price ||= product_orders.includes(:product).reduce(0) do |sum, a|
      sum + (a.quantity * a.price)
    end
  end

end
