class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @chefs = User.all
  end

  def show
    @chef = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(photos: [])
  end
end
