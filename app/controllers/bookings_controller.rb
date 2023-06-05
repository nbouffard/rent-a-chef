class BookingsController < ApplicationController
  before_action :set_booking, only: %i[new create]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.status = 'Pending'
    @booking.user = current_user
    @booking.chef = @chef
    if @booking.save!
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
  end

  def my_bookings
    @bookings = current_user.bookings
    @chef_bookings = Booking.where(chef: current_user)
  end


  private

  def booking_params
    params.require(:booking).permit(:date)
  end

  def set_booking
    @chef = User.find(params[:user_id])
  end

end
