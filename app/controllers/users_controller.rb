class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    render json: User.all, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:name, :email)
    end
end
