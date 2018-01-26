class ProductStructure < ApplicationRecord
  has_many :products
  # has_many :magazines
  has_many :magazines, :foreign_key => 'product_id', inverse_of: :product_structures

  validates :quantity, :presence => true, :numericality => true

end
