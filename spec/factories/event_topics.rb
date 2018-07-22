FactoryBot.define do
  factory :event_topic, class: 'Event::Topic' do
    event
    title { Faker::Lorem.sentence(3).delete('.')[0...99] }

    trait :without_relationships do
      event nil
    end
  end
end
