FactoryBot.define do
  factory :filter do
    user
    params { {city_id: 1, event_topic_title: 'Hello', start_time: Time.current, end_time: 1.day.since} }

    trait :without_relationships do
      user nil
    end
  end
end
