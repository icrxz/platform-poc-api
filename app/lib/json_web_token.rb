class JsonWebToken
  SECRET_KEY = Rails.application.credentials.jwt_token.to_s

  def self.encode(payload, exp=1.hour.since(Time.now))
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY, 'HS256')
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY).first
    HashWithIndifferentAccess.new(decoded)
  end
end