class Card < ApplicationRecord
  belongs_to :usd_account, class_name: 'Account'
  belongs_to :mxn_account, class_name: 'Account'

  validates :number, presence: true, uniqueness: { case_sensitive: false }
  validates :exp_month, presence: true
  validates :exp_year, presence: true
  validates :cvv, presence: true
  validates :blocked, presence: true
  validates :pin, presence: true

  after_initialize :generate_random_values
  after_initialize :set_defaults

  def generate_random_values
    set_random_number
    set_random_expiration_date
    set_random_cvv
    set_random_pin
  end

  def set_random_number
    self.number = CreditCardValidations::Factory.random(:visa)
  end

  def set_random_expiration_date
    current_date = DateTime.now

    starts_from = current_date + 24.months
    ends_to = current_date + 80.months

    exp_date = rand(starts_from..ends_to)

    self.exp_month = exp_date.strftime('%m')
    self.exp_year = exp_date.strftime('%Y')
  end

  def set_random_cvv
    self.cvv = format('%3d', rand(100..999))
  end

  def set_random_pin
    self.pin = format('%04d', rand(0..9999)).encrypt
  end

  def set_defaults
    self.blocked = true
  end

  # alias_method :blocked?, :blocked doesn't work beacuase
  # :blocked is a dynamic method
  def blocked?
    blocked
  end
end
