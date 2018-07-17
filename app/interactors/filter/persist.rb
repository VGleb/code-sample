class Filter::Persist < ::ApplicationInteractor
  def call
    context.fail! if context.validator.failure?

    if context.filter.present?
      context.filter.update!(context.params)
    else
      context.filter = ::Filter.create!(context.params)
    end

    context.filter.user_ids = context.filter.user_ids << context.user.id if context.user.present?
  end
end
