FactoryBot.define do
  factory :todo do
    text { Faker::Lorem.word }
    format { Faker::Lorem.word }
    width { Faker::Number.number(300) }
    height { Faker::Number.number(300) }
  end
end