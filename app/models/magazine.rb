class Magazine < ApplicationRecord
  has_many :products
  has_many :product_structures, :foreign_key => 'product_id'
  has_one :productshipment
  after_save :add_product_list
  accepts_nested_attributes_for :product_structures, allow_destroy: true
  accepts_nested_attributes_for :productshipment, allow_destroy: true

  def add_product_list
    if !self.product_id

      product = Product.new(:name => self.productname, :parent_id => false)

      product.save(:validate => false)
      product.update('product_f' => product.id)

      self.update_columns(product_id: product.id)
    end
  end

  def f
    @f ||= (self.price * 0.7).round(2)
  end

  def g x
    # koszt transportu
    # a = Curier.where(x: => :minweight.to_s..:maxweight.to_s)
    # User.where("name = :name and email = :email", { name: "Joe", email: "joe@example.com" })
   a = Curier.where(":x BETWEEN minweight AND maxweight",{ x: x }).first

    # a = Curier.where(x => ('maxweidth'.to_f)..('minweidth'.to_f))
# debugger
#      a = Curier.all
#      x.to_f.between?(1, 3)
#

if a.present?
  @g ||= a.price.to_f

else
  @g = 0

end
  end

  def h
    # marza
    @h ||= 10
  end

  def i
    @i ||= ((@f+@g) * (@h/100.to_f) + (@f + @g)).round(2)
  end

  def j
    @j ||= ((@l).to_i / 1.23).round(2)
  end

  def k
    @k ||= (@i * 1.23).round()
  end

  def l
    @l ||= @k.round(0)
  end

  def m
    @m ||= ((@l * 0.08)/1.23).round(2)
  end

  def n
    @n ||= ((@j-(@f+@g+@m))).round(2)
  end

  def o
    @o ||= (@l-(((@f+@g)*1.23)+(@m*1.23))).round(2)
  end


end
