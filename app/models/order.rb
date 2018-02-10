class Order < ApplicationRecord
  has_many :product_orders, inverse_of: :order
  has_many :products, :through => :product_orders, inverse_of: :orders
  has_one :client
  has_one :adress, :through => :client
  before_create :data_change


  accepts_nested_attributes_for :product_orders, allow_destroy: true
  accepts_nested_attributes_for :client, allow_destroy: true

  validates :name, :uniqueness => true

  def data_change
    if self.name.blank?
      if Order.last.nil?
        self.name = "1" + "/" + self.datatime.to_s
      else
        order = Order.last
        self.name = (order.id + 1).to_s + "/" + self.datatime
      end
    else
      if Order.last.nil?
        self.name = "1" + "/" + self.datatime.to_s
      end
    end
  end

  def total_price
    @total_price ||= product_orders.includes(:product).reduce(0) do |sum, a|
      sum + (a.quantity * a.price)
    end
  end

end
