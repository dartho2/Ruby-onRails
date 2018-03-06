class Order < ApplicationRecord
  has_many :product_orders, inverse_of: :order
  has_many :products, :through => :product_orders, inverse_of: :orders
  has_one :client, inverse_of: :order
  has_one :adress, :through => :client
  before_create :data_change

  accepts_nested_attributes_for :product_orders, allow_destroy: true
  accepts_nested_attributes_for :client, allow_destroy: true

  validates :name, :uniqueness => true

  def price_m c
    @a = self.products
    @b = Magazine.find_by('id' => @a.collect(&:product_f))
    @b.try(:price)
  end

  def self.aaaa x, y #todo dodanie kolejnej fv zakupowej do sumy
    a = Invoice.where("cast(strftime('%m%Y', datatime) as int) = ? AND cat_sell = ?", x.strftime('%m%Y'), y)
    # a = Invoice.where("cast(to_char(datatime, 'MMYYYY') as int) = ? AND cat_sell = ?", x.strftime('%m%Y'), y)
    # postsql heroku
    if a.exists?
      @b = a.try(:collect).sum {|n| MagazineInvoice.find_by('invoice_id' => n.id).price}
      # a.each {|sum, n | sum + n.cat_sell}
      if !@b.nil?
        '%.2f' % @b + " zł"
      end
    end
  end

  # def data_change
  #   if self.name.blank?
  #     if Order.last.nil?
  #       self.name = "1" + "/" + self.datatime.strftime('%m/%Y').to_s #TODO format FV '%m/%d/%Y'
  #     else
  #       order = Order.last
  #       self.name = (order.id + 1).to_s + "/" + self.datatime.strftime('%m/%Y').to_s
  #     end
  #   else
  #     if Order.last.nil?
  #       self.name = "1" + "/" + self.datatime.strftime('%m/%Y').to_s
  #     end
  #   end
  # end

  # format daty zaczyna nowy miesiac od 1/m/y
  def data_change
    if self.datatime.strftime('%m') == Order.last.datatime.strftime('%m')
      a = Order.where("cast(strftime('%m', datatime) as int) = ? AND cast(strftime('%Y', datatime) as int) = ?", self.datatime.strftime('%m'), self.datatime.strftime('%Y')).last
      a = a.name.split('/').first
      a = a.to_i + 1
      self.name = a.to_s + "/" + self.datatime.strftime('%m/%Y').to_s
    else
      if self.datatime.strftime('%m/%Y') < Order.last.datatime.strftime('%m/%Y')
        a = Order.where("cast(strftime('%m', datatime) as int) = ? AND cast(strftime('%Y', datatime) as int) = ?", self.datatime.strftime('%m'), self.datatime.strftime('%Y')).last
        a = a.name.split('/').first
        a = a.to_i + 1
        self.name = a.to_s + "/" + self.datatime.strftime('%m/%Y').to_s
      else
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
