class Api::V1::SessionsController < ::Api::V1::ApplicationController
  attr_reader :form_authenticity_token # workaround for sorcery login method

  def show
    if logged_in?
      render json: ::UserRepresenter.new(current_user)
    else
      render status: :unauthorized
    end
  end

  def create
    user = login(request_data_params[:email], request_data_params[:password])

    if user
      render json: ::UserRepresenter.new(user), status: :created
    else
      render status: :unprocessable_entity
    end
  end

  def destroy
    if logged_in?
      logout
      render status: :no_content
    else
      render status: :unauthorized
    end
  end
end
