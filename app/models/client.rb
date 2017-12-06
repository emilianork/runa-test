class Client < ApplicationRecord
  has_one :address, validate: true, required: true
  has_many :accounts, validate: true

  NAME_VALIDATIONS = { length: { in: 2..50 },
                       format: { with: /\A[A-Z]'?[-a-zA-Z]+([A-Z]'?[-a-zA-Z]+|\s)*\z/,
                                 message: "only allows letters" },
                       presence: true }.freeze

  
  validates :name, NAME_VALIDATIONS
  validates :paternal_last_name, NAME_VALIDATIONS
  validates :maternal_last_name, NAME_VALIDATIONS

  validates :gender, presence: true, length: { is: 1 },
            format: { with: /(F|M)/i,
                      message: 'only allows F or M' }

  validates :birthday, birthday: true, presence: true

  validates :document_type, uniqueness: { scope: :document_number },
            presence: true,
            format: { with: /(curp|passport|visa)/i,
                      message: 'only allows passport or visa'}

  validates :document_number, document_number: true, presence: true
end
