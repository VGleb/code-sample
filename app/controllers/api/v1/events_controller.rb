class Api::V1::EventsController < ::Api::V1::ApplicationController
  def index
    query = ::Event::FilteredListQuery.new(params)
    query = ::LimitedQuery.new(params, query)

    ::Filter::Create.call(params: {params: params.to_unsafe_h}, user: current_user) if current_user.present?

    render json: ::CollectionRepresenter.new(query.all).to_hash(meta: query.meta)
  end

  def create
    # TODO: Authorization

    result = ::Event::Create.call(params: request_data_params)

    if result.success?
      render json: ::EventRepresenter.new(result.event)
    else
      render status: :unprocessable_entity
    end
  end
end
