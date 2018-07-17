FactoryBot.define do
  factory :filter do
    params { {city_id: 1, event_topic_title: 'hello', start_time: Time.current, end_time: 1.day.since} }
  end
end
