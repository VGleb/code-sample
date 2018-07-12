class Event::Topic < ::ApplicationModel
  belongs_to :event
  belongs_to :type, class_name: 'Event::Topic::Type'
end
