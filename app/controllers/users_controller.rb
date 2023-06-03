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

    if @chef == current_user
      redirect_to user_path(current_user), notice: 'You cannot book yourself.'
      return
    end

    @booking = @chef.bookings.build(booking_params)
    @booking.user = current_user
    @booking.status = "Pending"

    if @booking.save
      redirect_to user_path(current_user), notice: 'Booking request sent.'
    else
      render :book_chef
    end
  end

  def my_bookings
    @bookings = current_user.bookings
  end

  def destroy_booking
    @booking = Booking.find_by(id: params[:id])
    if @booking
      if @booking.destroy
        redirect_to my_bookings_users_path, notice: 'Booking deleted successfully.'
      end
    else
      redirect_to my_bookings_users_path, alert: 'Booking not found.'
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
    params.require(:booking).permit(:status, :date, :chef_id)
  end
end
