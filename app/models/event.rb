class Event < ::ApplicationModel
  belongs_to :city
  has_many :topics, class_name: 'Event::Topic'
end
