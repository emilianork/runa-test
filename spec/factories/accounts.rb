FactoryBot.define do
  factory :account do
    currency { ['USD', 'MXN'].sample }
    balance 0
    maintenance_cost 0
    cancellation_date nil
  end
end
