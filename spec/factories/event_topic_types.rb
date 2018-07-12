FactoryBot.define do
  factory :event_topic_type, class: 'Event::Topic::Type' do
    name { Faker::Lorem.word }
  end
end
