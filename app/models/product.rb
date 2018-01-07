class Product < ApplicationRecord
  attr_accessor :new_category_name
  # attr_accessor :show_product_history

  belongs_to :category, required: false
  has_many :product_orders, inverse_of: :product
  has_many :orders, :through => :product_orders, inverse_of: :products

  before_save :create_category_from_name
  before_update :check_parent_id
  before_destroy :set_deleted_id
  validates :name, presence: true, length: {minimum: 3, maximum: 20}
  validates :price, numericality: true

  def create_category_from_name
    create_category(name: new_category_name) unless new_category_name.blank?
  end
  # def show_product_history(id)
  #   if (Product.exists?(id) && Product.exists?(:parent_id => id ))
  #     product =  Product.find(id)
  #     history ||= "Price=  #{product.price} parent_id = #{product.parent_id}"
  #     puts "#{history}"
  #     show_product_history(product.parent_id)
  #   end
  # end


  def check_parent_id
    product = Product.find(self.id)
    if (self.price != product.price)
      Product.find(product.id).update(deleted: true)
      product = Product.create(name: self.name, parent_id: product.id, price: self.price)
      product.save
    end
  end

  def set_deleted_id
    if (Product.exists?(:id => self.parent_id))
      Product.find(self.parent_id).update(deleted: false)
    end
  end
end

