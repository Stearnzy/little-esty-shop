class InvoiceItem < ApplicationRecord
  validates :quantity, presence: true
  validates :unit_price, presence: true
  validates :status, presence: true

  belongs_to :item
  belongs_to :invoice

  enum status: [:pending, :packaged, :shipped]
end
