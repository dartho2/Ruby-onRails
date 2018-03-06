class ProductOrder < ApplicationRecord
  belongs_to :order, inverse_of: :product_orders
  belongs_to :product, inverse_of: :product_orders
  has_many :magazines


  before_save :check_magazine

  accepts_nested_attributes_for :product, allow_destroy: true

  def product_attributes=(attributes)
    if attributes['id'].present?
      self.product = Product.find(attributes['id'])
    end
    super
  end

  def ddd
    Product.find_by(:id => product_id).code
  end

  def price_m c
    @a = self.product
    @b = Magazine.find_by('id' => @a.product_f)
    @b.try(:price)
  end

  def check_magazine
    a = Product.find(product_id)
    if a.product_f.nil?
      a.product_f = a.id
    end
    if !a.deleted.blank?
      a = Product.where(:parent_id => a.id).last
      a.update(:price => self.price)
    else
      a.update(:deleted => true)
      # nowa kolumna z poczatkowym id magazynu
      Product.create(:price => a.price, :code => a.code, :name => a.name, :parent_id => a.id, :product_f => a.product_f)
      self.price_z = self.product.magazine.price
      self.name = a.name
      self.price = a.price
      self.quantity = a.quantity
    end
    check_magazine_product(a)
  end

  def check_magazine_product a

    if Product.exists?(a.parent_id)
      a = Product.find(a.parent_id)
      check_magazine_product(a)
    else
      # update product magazyne
      # Product.where(:id => self.product_id).update(:product_f => a.id)

      magazine_update(a)
    end
  end

#TODO repare update magazine
  def magazine_update x
    a = Magazine.find_by :product_id => x.id
    if !ProductOrder.find_by(:order_id => self.order_id, :product_id => self.product_id).nil?
      x = ProductOrder.find_by(:order_id => self.order_id, :product_id => self.product_id)
      if x.quantity != self.quantity
        if x.quantity < self.quantity
          x.quantity -= self.quantity #todo +=
          a.quantity += x.quantity
          a.update(quantity: a.quantity)
        else
          x.quantity -= self.quantity #todo +=
          a.quantity += x.quantity
          a.update(quantity: a.quantity)
        end
      end
    else
      a.quantity -= self.quantity #todo +=
      a.update(quantity: a.quantity)
    end
  end
end



