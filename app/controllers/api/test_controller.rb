class Api::TestController < Api::BaseController
  before_action :authenticate_request, only: :private_api
  def private_api
    render json: {status: :success}
  end

  def public_api
    render json: {status: :success}
  end
end
