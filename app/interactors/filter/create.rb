class Filter::Create < ::ApplicationOrganizer
  organize(
    ::Filter::Create::Validate,
    ::Filter::Create::BuildHashsum,
    ::Filter::Persist
  )
end
