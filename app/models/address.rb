class Address < ApplicationRecord
  belongs_to :client

  validates :street1, presence: true, length: { maximum: 100 }
  validates :street2, presence: true, length: { maximum: 100 }

  validates :street3, length: { maximum: 100 }

  validates :city,  presence: true, length: { maximum: 100 }
  validates :state, presence: true, length: { maximum: 100 }
end
