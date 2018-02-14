class Invoice < ApplicationRecord
  has_many :magazine_invoices, inverse_of: :invoice
  has_many :magazines, :through => :magazine_invoices, inverse_of: :invoices

  accepts_nested_attributes_for :magazine_invoices, allow_destroy: true
  accepts_nested_attributes_for :magazines, allow_destroy: true
  validates :name, :presence => true

def total_price
  @total_price ||= magazine_invoices.includes(:magazine).reduce(0) do |sum, a|
    sum + (a.quantity * a.price)
  end
end

end
