class Api::V1::SessionsController < ::Api::V1::ApplicationController
  attr_reader :form_authenticity_token # workaround for sorcery login method

  def show
    if current_user
      render json: ::UserRepresenter.new(current_user)
    else
      render status: :forbidden
    end
  end

  def create
    user = login(request_data_params[:email], request_data_params[:password])

    if user
      render json: ::UserRepresenter.new(user)
    else
      render status: :forbidden
    end
  end

  def destroy
    logout
    render status: :no_content
  end
end
