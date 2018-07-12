FactoryBot.define do
  factory :event do
    city
    title { Faker::Lorem.sentence(3).delete('.')[0...99] }
    address { Faker::Address.street_address }
    start_time { Time.current }
    end_time { 1.day.since }

    trait :without_relationships do
      city nil
    end
  end
end
