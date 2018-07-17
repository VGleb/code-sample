class Event::Create::NotifyUsersWhoInterested < ::ApplicationInteractor
  def call
    ::Event::NotifyUsersWhoInterestedWorker.perform_in(3.seconds, context.event.id)
  end
end
