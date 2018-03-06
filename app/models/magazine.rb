class Magazine < ApplicationRecord
  attr_accessor :code, :price_sell
  has_one :product, :primary_key => 'product_id', :foreign_key => 'id', class_name: "Product", inverse_of: :magazine
  has_many :product_orders
  has_many :product_structures, :foreign_key => 'id'
  has_one :productshipment
  has_many :magazine_invoices, inverse_of: :magazine
  has_many :invoices, :through => :magazine_invoices, inverse_of: :magazines
  validates :productname, :presence => true, :on => :create
  validates :cat_buy, presence: true, :numericality => true, :on => :create, :inclusion => 0..4, :if => :check_if_form_one?
  validates :price_sell, :presence => true, :numericality => true, :on => :create, :if => :check_if_form_one?
  validates :code, :presence => true, :on => :create, :if => :check_if_form_one?
  validates :price, :presence => true, :numericality => true, :on => :create, :if => :check_if_form_one?
  validates :marza, :presence => true, :numericality => true, :on => :create, :if => :check_if_form_one?
  validates :quantity, :presence => true, :numericality => true, :on => :create, :if => :check_if_form_one?
  validates :productshipment, :presence => true, :on => :create, :if => :check_if_form_one?
  before_update :add_quantity_to_magazine
 # Todo dla edytowania validacja nie poprawna
  after_save :add_product_list
  # before_update :add_quantity_to_magazine

  accepts_nested_attributes_for :product_structures, allow_destroy: true
  accepts_nested_attributes_for :productshipment, allow_destroy: true

  def add_quantity_to_magazine

  end
  def check_if_form_one?
    self.cat_buy == '0'.to_i
  end

  def last_price
    a = Product.where(:product_f => self.product_id).last
   a.price
  end

  def Magazine.autocomplete_by_description(term)
    t = arel_table
    q = t
          .project(t[:id].maximum.as("id"), t[:product_id], t[:productname], t[:id], t[:cat_buy], t[:price])
          .where(t[:productname].matches("%#{term}%"))
          .group(t[:productname], t[:product_id], t[:id], t[:cat_buy], t[:price])
          .order(t[:productname], t[:product_id], t[:id], t[:cat_buy], t[:price])
    find_by_sql(q.to_sql)
  end

  #
  # def form_type
  #   self[:form_type]
  # end

  def add_product_list
      if !self.product_id
        product = Product.new(:name => self.productname, :price => self.price_sell, :code => self.code, :parent_id => false, :product_f => self.id)
        product.save(:validate => false)
        self.update_columns(product_id: product.id)
      end
  end

  def f
    @f ||= (self.price).round(2)
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
