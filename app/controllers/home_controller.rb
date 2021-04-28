class HomeController < ApplicationController
	skip_before_action :authenticate_request

	 def index
	 	render json: {
        message: 'Welcome to API'
      }
	 end
end