class Api::V1::UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  before_action :set_user, only: %i[show, update, destroy]

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private
  
  def set_user
    begin
      @user = User.find_by_email!(params[:email])
    rescue ActiveRecord::RecordNotFound
      render json: {errors: "User not found!"}, status: :not_found
    end
  end

  def user_params
    params.require(:user).permit( :email,
                                  :name,
                                  :cpf,
                                  :password
                                )
  end
end