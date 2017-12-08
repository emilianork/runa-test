FactoryBot.define do
  factory :account do
    currency { %w[USD MXN].sample }
    balance 0
    monthly_maintenance_cost 0
    cancellation_date nil
  end
end
