class ProductStructure < ApplicationRecord
  has_many :products
  # has_many :magazines
  has_one :magazines
end
