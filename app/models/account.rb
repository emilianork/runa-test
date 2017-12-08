class Account < ApplicationRecord
  belongs_to :client

  has_one :usd_card, foreign_key: 'usd_account_id', class_name: 'Card'
  has_one :mxn_card, foreign_key: 'mxn_account_id', class_name: 'Card'

  validates :account_number, presence: true, length: { is: 14 }
  validates :currency, presence: true, format: { with: /\A(USD|MXN)\z/i,
                                                 message: 'only allows USD or MXN' }

  validates :balance, presence: true, numericality: { only_integer: true,
                                                      greater_than_or_equal_to: 0 }

  validates :monthly_maintenance_cost, presence: true, numericality: { only_integer: true,
                                                                       greater_than_or_equal_to: 0 }

  after_initialize :set_defaults

  def set_defaults
    last_account = Account.select('account_number')
                          .order(account_number: :desc)
                          .first

    self.account_number = if last_account
                            # Last possible account number
                            if last_account_number != '999-9999999999'
                              last_account_number.succ
                                                  end
                          else
                            '000-0000000000'
                          end

    self.balance ||= 0
    self.monthly_maintenance_cost ||= 0
  end
end
