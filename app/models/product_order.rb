class ProductOrder < ApplicationRecord
  attr_accessor :flash_notice
  belongs_to :order, inverse_of: :product_orders
  belongs_to :product, inverse_of: :product_orders

  validates :quantity, presence: true
  before_save :check_magazine

  accepts_nested_attributes_for :product, allow_destroy: true

  def product_attributes=(attributes)
    if attributes['id'].present?
      self.product = Product.find(attributes['id'])
    end
    super
  end

  def check_magazine
    a = Product.find(product_id)
    check_magazine_product(a)
  end


  def check_magazine_product a
    if Product.exists?(a.parent_id)
      a = Product.find(a.parent_id)
      check_magazine_product(a)
    else
      magazine_update(a)
    end
  end

# TODO
  def magazine_update x

    if !x.nil?
      a = Magazine.find_by :product_id => x.id
      if !ProductOrder.find_by(:order_id => self.order_id, :product_id => self.product_id).nil?
        x = ProductOrder.find_by(:order_id => self.order_id, :product_id => self.product_id)
        if x.quantity != self.quantity
          if x.quantity < self.quantity
            x.quantity = x.quantity - self.quantity #todo +=
            a.quantity = a.quantity + x.quantity
            a.update(quantity: a.quantity)
          else
            x.quantity = x.quantity - self.quantity #todo +=
            a.quantity = a.quantity + x.quantity
            a.update(quantity: a.quantity)
          end
        end
      else
        a.quantity = a.quantity - self.quantity #todo +=
        a.update(quantity: a.quantity)
      end
    else
      self.flash_notice ="wrongs"
    end
  end
end


