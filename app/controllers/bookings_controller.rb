class BookingsController < ApplicationController
  before_action :set_booking, only: %i[new create]

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

  private

  def booking_params
    params.require(:booking).permit(:date)
  end

  def set_booking
    @chef = User.find(params[:user_id])
  end

end
