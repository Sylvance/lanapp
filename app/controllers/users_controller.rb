# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  before_action :check_user, only: %i[update destroy]
  skip_before_action :authenticate_request, only: [:create]

  # GET /users
  def index
    @users = User.by_date

    paginate json: @users, per_page: 15
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user&.avatar&.attach(params[:user][:avatar])

    @user.save!
    render json: @user, status: :created, location: @user
  end

  # PATCH/PUT /users/1
  def update
    @user.update!(user_params)
    render json: @user
  end

  # DELETE /users/1
  def destroy
    @user.avatar.purge_later
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def check_user
    if @user.id == @current_user.id
      @user
    else
      render json: { "success": false,
                     "errors": [
                       {
                         "resource": 'user',
                         "field": 'id',
                         "code": 1044,
                         "message": 'Unable to process this request'
                       }
                     ] }, status: :unprocessable_entity
    end
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :email, :bio, :password, :password_confirmation, :avatar)
  end
end
