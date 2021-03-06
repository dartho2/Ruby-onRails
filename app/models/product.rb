class Product < ApplicationRecord
  attr_accessor :new_category_name
  has_many :product_structure, foreign_key: "product_id"
  has_one :magazine, :foreign_key => 'product_id', class_name: "Magazine", primary_key: 'product_f', inverse_of: :product
  belongs_to :category, required: false
  has_many :product_orders, inverse_of: :product
  has_one :productshipment, :through => :magazine
  has_many :orders, :through => :product_orders, inverse_of: :products
  validates :price, :presence => true,
            :numericality => true,
            :format => { :with => /\A\d{1,4}(.\d{0,2})?\z/ }
  # validates :id , presence:  true
  before_save :create_category_from_name
  before_destroy :set_deleted_id

  def value_b
  end

  def vat_
  end

  def unit
  end

  def prince_n
  end

  def Product.autocomplete_by_description(term)
    t = arel_table
    q = t
          .project(t[:id].maximum.as("id"), t[:name], t[:code], t[:price])
          .where(t[:name].matches("%#{term}%").or(t[:code].matches("%#{term}%",)).and(t[:deleted].eq(false)))
          .group(t[:name], t[:code],  t[:price])
          .order(t[:name], t[:code],  t[:price])
    find_by_sql(q.to_sql)
  end

  def create_category_from_name
    create_category(name: new_category_name) unless new_category_name.blank?
  end

  def set_deleted_id
    if (Product.exists?(:id => self.parent_id))
      Product.find(self.parent_id).update(deleted: false)
    end
  end

end

