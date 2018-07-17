class Event::Persist < ::ApplicationInteractor
  def call
    context.fail! if context.validator.failure?

    if context.event.present?
      context.event.update!(context.params)
    else
      context.event = ::Event.create!(context.params)
    end
  end
end
