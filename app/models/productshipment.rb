class Productshipment < ApplicationRecord
  has_one :magazine
  #
  # validates :height, :presence => true, :numericality => true
  # validates :weight, :presence => true, :numericality => true
  # validates :width, :presence => true, :numericality => true
  # validates :depth, :presence => true, :numericality => true
end
