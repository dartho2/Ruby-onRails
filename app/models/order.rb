class Order < ApplicationRecord
  has_many :product_orders, inverse_of: :order
  has_many :products, :through => :product_orders, inverse_of: :orders
  has_one :client
  has_one :adress, :through => :client
  before_create :data_change

  accepts_nested_attributes_for :product_orders, allow_destroy: true
  accepts_nested_attributes_for :client, allow_destroy: true

  validates :name, :uniqueness => true

  def price_m c
    @a = self.products
    @b = Magazine.find_by('id' => @a.collect(&:product_f))
    @b.price
  end

  def self.aaaa x, y #todo dodanie kolejnej fv zakupowej do sumy
    a = Invoice.where("cast(strftime('%m%Y', datatime) as int) = ? AND cat_sell = ?", x.strftime('%m%Y'), y)
    if a.exists?
      @b = a.sum {|n| MagazineInvoice.find_by('invoice_id' => n.id).price}.to_f
      # a.each {|sum, n | sum + n.cat_sell}
      if !@b.nil?
        @b
      end
    end

  end

#
# def name x = nil
#   @x = Product.where('id' => self.id)
#   @x.name
# end
# def quantity x = nil
#   @x = Product.find(self.id)
#   @x.quantity
# end
#
#   def price x = nil
#     @x = Product.find(self.id)
#     @x.price
# #   end
#   <tr>
#   <td><%= order.sale_date.strftime('%m/%d/%Y') %></td>
#             <td><%= order.name(order.id) %></td>
#             <td data-role="quantity_earning"><%= order.quantity(order.id)%></td>
#   <td data-role="price_earning"><%= order.price(order.id) %></td>
#             <td><%= order.sale_date %></td>
#   <td data-role="price_b_earning"><%= order.price_m(order) %></td>
#           </tr>

  def data_change
    if self.name.blank?
      if Order.last.nil?
        self.name = "1" + "/" + self.datatime.strftime('%m/%Y').to_s #TODO format FV '%m/%d/%Y'
      else
        order = Order.last
        self.name = (order.id + 1).to_s + "/" + self.datatime.strftime('%m/%Y').to_s
      end
    else
      if Order.last.nil?
        self.name = "1" + "/" + self.datatime.strftime('%m/%Y').to_s
      end
    end
  end

  def total_price
    @total_price ||= product_orders.includes(:product).reduce(0) do |sum, a|
      sum + (a.quantity * a.price)
    end
  end

end
