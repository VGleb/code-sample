class Event < ::ApplicationModel
  belongs_to :city, optional: true
  has_many :topics, class_name: 'Event::Topic'
end
