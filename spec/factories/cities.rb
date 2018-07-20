FactoryBot.define do
  factory :city do
    name { Faker::Address.city }

    trait :without_relationships do
    end
  end
end
