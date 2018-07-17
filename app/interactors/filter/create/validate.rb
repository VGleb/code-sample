class Filter::Create::Validate < ::ApplicationInteractor
  def call
    context.validator = ::Filter::CreateValidator.new(context.params).validate

    context.fail! if context.validator.failure?

    context.params = context.validator.output
  end
end
