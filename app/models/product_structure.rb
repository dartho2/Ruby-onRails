class ProductStructure < ApplicationRecord
  has_many :products
  # has_many :magazines
  has_many :magazines, inverse_of: :product_structures
end
