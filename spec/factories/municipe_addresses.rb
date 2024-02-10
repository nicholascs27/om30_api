FactoryBot.define do
  factory :municipe_address do
    association :municipe
    street        { Faker::Address.street_name }
    street_number { Faker::Address.building_number }
    neighborhood  { Faker::Address.community }
    cep           { Faker::Address.zip_code }
    city          { Faker::Address.city }
    state         { Faker::Address.state_abbr }
    ibge_code     { Faker::Number.number(digits: 7) }
  end
end
