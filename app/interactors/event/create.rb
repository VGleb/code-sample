class Event::Create < ::ApplicationOrganizer
  organize(
    ::Event::Create::Validate,
    ::Event::Persist,
    ::Event::Create::NotifyUsersWhoInterested
  )
end
