class Api::ApplicationController < ActionController::API
  include Sorcery::Controller

  private

  def request_data_params
    params[:data]&.to_unsafe_h&.symbolize_keys || {}
  end
end
