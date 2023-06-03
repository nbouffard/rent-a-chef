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
    @chef = current_user
  end

  def update
    @chef = current_user
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

  def check_availability
    @chef = User.find(params[:id])
    current_date = Date.today
    conflicting_bookings = chef.bookings.where(date: current_date)
    @availability = conflicting_bookings.empty?
  end

  private

  def chef_params
    params.require(:user).permit(:first_name, :last_name, :bio, :specialties)
  end

  def ensure_chef
    redirect_to root_path unless current_user.is_chef?
  end

  def booking_params
    params.require(:booking).permit(:status, :date)
  end
end
