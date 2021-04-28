class ProfileController < ApplicationController

	def index
		
    if @current_user
      render json: @current_user, status: :ok
    else
      render json: { error: 'Error.' }, status: :not_found
    end
		
	end

end