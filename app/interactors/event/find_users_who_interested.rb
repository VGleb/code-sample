class Event::FindUsersWhoInterested < ::ApplicationInteractor
  def call
    context.filters = ::Filter::FindProbableByEventQuery.new(context.event)

    user_ids = []

    context.filters.each do |filter|
      event_matched = ::Event.where(id: context.event).merge(filter.decorate.to_events_query).exists?
      user_ids << filter.user_id if event_matched
    end

    context.users = ::User.where(id: user_ids.uniq.sort)
  end
end
