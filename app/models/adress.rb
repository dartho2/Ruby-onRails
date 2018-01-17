class Adress < ApplicationRecord
  belongs_to :client
  validates :company_zip, presence: true
  validates :company_street, presence: true
  validates :company_city, presence: true
  validates :company_number, presence: true

end
