class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :ensure_chef, only: [:edit, :update]

  def index
    @chefs = User.all
  end

  def show
    @chef = User.find(params[:id])
  end

  def edit
  end

  def update
    if @chef.update(chef_params)
      redirect_to @chef, notice: 'Profile updated successfully!'
    else
      render :edit
    end
  end

  def book_chef
    @chef = User.find(params[:id])
    @booking = Booking.new
  end

  def create_booking
    @chef = User.find(params[:id])
    @booking = @chef.bookings.build(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to root_path, notice: 'Chef booked successfully!'
    else
      render :book_chef
    end
  end
  private

  def chef_params
    params.require(:user).permit(:first_name, :last_name, :description, :address, :date_of_birth, :price)

  end

  def ensure_chef
    @chef = current_user
    redirect_to root_path unless @chef.is_chef?

  end

  def user_params
    params.require(:user).permit(photos: [])
  end

  def booking_params
    params.require(:booking).permit(:status, :date)
  end
end
