class Api::V1::AuthController < ApplicationController
  skip_before_action :authorize_request, only: :signin

  def signin
    @user = User.find_by_email(params[:email])

    if @user&.valid_password?(params[:password])
      exp = 4.hours.since(Time.now)
      token = JsonWebToken.encode(user_id: @user.id, exp: exp)

      response.headers['Authorization'] = "Bearer #{token}"
      render json: {token: token, exp: exp.strftime("%d/%m/%Y - %H:%M:%S")}, status: :created
    else
      head(:unauthorized)
    end
  end

  def logout

  end

  private

  def login_params
    params.permit(:email, :password)
  end
end