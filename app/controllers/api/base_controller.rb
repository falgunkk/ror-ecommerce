class Api::BaseController < ApplicationController
  def authenticate
    result = AuthenticateUser.new(params[:email], params[:password]).call
    if result[:success]
      render json: { auth_token: result[:token] }
    else
      render json: { error: result[:error] }, status: :unauthorized
    end
  end

  def authenticate_request
    @current_user = AuthorizeApiRequest.new(request.headers).call
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
