class AuthenticationController < ApplicationController
 skip_before_action :authenticate_request

 def authenticate
   command = AuthenticateUser.call(params[:email], params[:password])

   if command.success?
     render json: { auth_token: command.result, alert: "Login Sucessfully" }
   else
     render json: { error: 'Sorry ! Your username or password incorrect.' }, status: :unauthorized
   end
 end
end