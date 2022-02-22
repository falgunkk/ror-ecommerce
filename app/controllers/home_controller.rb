class HomeController < ApplicationController
	def index
	end

	def ajax_call
	  user_id = User.find_by_email(params[:email]).id
	  render json: {user_id: user_id}
	end
end
