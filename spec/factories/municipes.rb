FactoryBot.define do
  factory :municipe do
    full_name     { Faker::Name.name }
    email         { Faker::Internet.email }
    birth_date    { Faker::Date.birthday(min_age: 18, max_age: 65) }
    telephone     { Faker::PhoneNumber.phone_number }
    cpf           { Faker::CPF.numeric }
    cns           { Faker::Number.number(digits: 15) }
    photo         { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, "/spec/files/logo_om30.png")), "image/png") }
  end
end
