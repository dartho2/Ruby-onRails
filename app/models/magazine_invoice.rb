class MagazineInvoice < ApplicationRecord
  belongs_to :invoice, inverse_of: :magazine_invoices
  belongs_to :magazine, inverse_of: :magazine_invoices
    accepts_nested_attributes_for :magazine, allow_destroy: true

  def magazine_attributes=(attributes)
    if attributes['id'].present?
      self.magazine = Magazine.find(attributes['id'])
      a = self.magazine
      a.quantity += self.quantity
      a.update(:quantity => a.quantity)
    end
    super
  end
end
