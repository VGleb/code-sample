class FilterDecorator < ::ApplicationDecorator
  def to_events_query
    ::Event::FilteredListQuery.new(params.symbolize_keys)
  end
end
