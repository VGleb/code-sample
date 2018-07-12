class Event::Topic::Type < ::ApplicationModel
  has_many :topics, class_name: 'Event::Topic'
end
