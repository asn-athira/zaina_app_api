class JsonWebToken
 class << self
  #HMAC_SECRET = Rails.application.secrets.secret_key_base
       HMAC_SECRET = ENV["SECRET_KEY_BASE"]
   def encode(payload, exp = 24.hours.from_now)
     payload[:exp] = exp.to_i
     JWT.encode(payload, HMAC_SECRET)
   end

   def decode(token)
     body = JWT.decode(token, HMAC_SECRET)[0]
     HashWithIndifferentAccess.new body
   rescue
     nil
   end
 end
end