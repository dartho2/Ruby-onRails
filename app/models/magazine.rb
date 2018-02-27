class Magazine < ApplicationRecord
  attr_accessor :code, :price_sell
  has_many :products
  has_many :product_orders
  has_many :product_structures, :foreign_key => 'product_id'
  has_one :productshipment
  has_many :magazine_invoices, inverse_of: :magazine
  has_many :invoices, :through => :magazine_invoices, inverse_of: :magazines

  validates :price_sell, :presence => true, :numericality => true
  validates :code, :presence => true
  validates :productname, :presence => true
  validates :price, :presence => true, :numericality => true
  validates :marza, :presence => true, :numericality => true
  validates :quantity, :presence => true, :numericality => true
  validates :productshipment, :presence => true


  after_save :add_product_list
  # before_update :add_quantity_to_magazine

  accepts_nested_attributes_for :product_structures, allow_destroy: true
  accepts_nested_attributes_for :productshipment, allow_destroy: true


  def add_product_list
    if !self.product_id
      product = Product.new(:name => self.productname, :price => self.price_sell, :code => self.code, :parent_id => false, :product_f => self.id)
      product.save(:validate => false)
      self.update_columns(product_id: product.id)
    end
  end

  def f
    @f ||= (self.price * 0.7).round(2)
  end

  def g x, y
    a = Curier.where(":x BETWEEN minweight AND maxweight AND maxheight > :y", {x: x, y: y}).order("price ASC").first
    if a.present?
      @g ||= a.price
       a.label + " " + @g.to_s
          else
      @g = 1
       "-"
    end
  end

  def h
    # marza
    @h ||= self.marza
  end

  def i
    @i ||= ((@f+@g) * (@h/100.to_f) + (@f + @g)).round(2)
  end

  def j
    @j ||= ((@k).to_i / 1.23).round(2)
  end

  def k
    #  Cena sprzedazy allegro brutto
    @k ||= (@i * 1.23).round()
  end

  def m
    @m ||= ((@k * 0.08)/1.23).round(2)
  end

  def n
    @n ||= ((@j-(@f+@g+@m))).round(2)
  end

  def o
    @o ||= (@k-(((@f+@g)*1.23)+(@m*1.23))).round(2)
  end
end
