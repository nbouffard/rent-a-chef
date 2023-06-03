class BookingsController < ApplicationController
  before_action :set_booking_user, only: %i[new create]
  before_action :set_booking, only: %i[edit update]


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

  end

  def update
    if @booking.update!(booking_params)
      redirect_to my_bookings_bookings_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def my_bookings
    @bookings = current_user.bookings
    @chef_bookings = Booking.where(chef: current_user)
  end


  private

  def booking_params
    params.require(:booking).permit(:date, :status)
  end

  def set_booking_user
    @chef = User.find(params[:user_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
