class Event::NotifyUsersWhoInterestedWorker < ::ApplicationWorker
  sidekiq_options retry: false, queue: :default

  def perform(id)
    event = ::Event.find(id)
    ::Event::NotifyUsersWhoInterested.call!(event: event)
  end
end
