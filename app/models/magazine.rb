class Magazine < ApplicationRecord
  has_many :products
  has_many :product_structures, :foreign_key => 'product_id'
  has_one :productshipment
  after_save :add_product_list
  accepts_nested_attributes_for :product_structures, allow_destroy: true
  accepts_nested_attributes_for :productshipment, allow_destroy: true

  def add_product_list
    if !self.product_id
      product = Product.new(:name => self.productname, :parent_id => false, :product_f => self.id)

      product.save(:validate => false)
      # product.update('product_f' => product.id)

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
      @g = 0
       "-"

    end
  end
  def kurier kurier
    kurier
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
