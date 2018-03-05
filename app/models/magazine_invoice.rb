class MagazineInvoice < ApplicationRecord
  attr_accessor :price_n_m
  belongs_to :invoice, inverse_of: :magazine_invoices
  belongs_to :magazine, inverse_of: :magazine_invoices

    accepts_nested_attributes_for :magazine, allow_destroy: true

  def magazine_attributes=(attributes)
    if attributes['id'].present?
      self.magazine = Magazine.find(attributes['id'])
      a = self.magazine
      if a.cat_buy == 0
      a.price = self.price
      a.quantity += self.quantity
      a.update(:quantity => a.quantity)
      end
      end
    super
  end
end
