class Product < ApplicationRecord
  attr_accessor :new_category_name
  # attr_accessor :show_product_history
  has_many :magazines
  belongs_to :category, required: false
  has_many :product_orders, inverse_of: :product
  has_many :orders, :through => :product_orders, inverse_of: :products
  # before_save :create_magazin_product if not exists
  before_save :create_category_from_name
  before_update :check_parent_id
  before_destroy :set_deleted_id
  validates :name, presence: true, length: {minimum: 3, maximum: 20}


  def create_category_from_name
    create_category(name: new_category_name) unless new_category_name.blank?
  end

  def check_parent_id
    # product = Product.find(self.id)
    # if (self.price != product.price)
    #   Product.find(product.id).update(deleted: true)
    #   Product.create(name: self.name, parent_id: product.id, price: self.price)
    #   # product.save  todo
    #
    # end

  end

  def set_deleted_id
    if (Product.exists?(:id => self.parent_id))
      Product.find(self.parent_id).update(deleted: false)
    end
  end
end

