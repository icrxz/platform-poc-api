class ApplicationController < ActionController::API
  before_action :authorize_request

  def authorize_request    
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      decoded = JsonWebToken.decode(header)
      current_user = User.find(decoded[:user_id])
      response.headers['Jwt-Token-Renewed'] = "Bearer #{renew_token(decoded)}"
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message}, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message}, status: :unauthorized
    end
  end

  private

  def renew_token(decoded)
    JsonWebToken.encode(decoded, 2.hours.since(Time.now))
  end

end
