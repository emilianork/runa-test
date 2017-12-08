FactoryBot.define do
  factory :client do
    name                { Faker::Name.first_name }
    paternal_last_name  { Faker::Name.last_name }
    maternal_last_name  { Faker::Name.last_name }

    gender { %w[F M].sample }

    birthday { [*(18..100)].sample.years.ago }

    document_type { %w[passport visa].sample }
    document_number { Faker::Lorem.characters(20) }

    association :address, strategy: :build
  end
end
