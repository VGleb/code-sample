class FilterRepresenter < ::SingularRepresenter
  property :params do
    property :city_id
    property :start_time
    property :end_time
    property :event_topic_title
  end
end
