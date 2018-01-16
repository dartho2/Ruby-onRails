class Client < ApplicationRecord
  belongs_to :order, inverse_of: :client
  has_one :adress, inverse_of: :client
  accepts_nested_attributes_for :adress
 end
