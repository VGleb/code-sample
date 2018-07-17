class Event::NotifyUsersWhoInterested < ::ApplicationInteractor
  def call
    context.users = find_users_who_interested(context.event)

    context.users.each do
      # TODO: Logic of notifications
    end
  end

  private

  def find_users_who_interested(event)
    filters = ::Filter::FindProbableByEventQuery.new(event)

    user_ids = []

    filters.each do |filter|
      event_matched = ::Event.where(id: event).merge(filter.decorate.to_events_query).exists?
      user_ids << filter.user_ids if event_matched
    end

    ::User.where(id: user_ids.uniq.sort)
  end
end
