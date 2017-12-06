FactoryBot.define do
  factory :address do
    street1 { Faker::Address.street_address }
    street2 { Faker::Address.secondary_address }
    
    city { Faker::Address.city }
    state { Faker::Address.state }
  end
end
