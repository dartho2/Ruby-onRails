class Client < ApplicationRecord
  belongs_to :order, inverse_of: :client, foreign_key: "order_id"
  has_one :adress
  accepts_nested_attributes_for :adress

  validates :firstname, presence: true

 end
