FactoryBot.define do
  factory :event_topic, class: 'Event::Topic' do
    event
    event_topic_type
    title { Faker::Lorem.sentence(3).delete('.')[0...99] }
  end
end
