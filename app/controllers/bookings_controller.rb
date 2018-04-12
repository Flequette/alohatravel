class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  def index
    @deal = Deal.find(params[:deal_id])
    @bookings = Booking.where(deal_id: params[:deal_id])
  end

  def show
    @demi_journées = ((@booking.end_date - @booking.start_date).to_i) * 2
  end

  def new
    @booking = Booking.new
  end

  def create
    @deal = Deal.find(params[:deal_id])

    @booking = Booking.new(booking_params)
    @booking.profile = current_user.profile
    @booking.deal = @deal

    if @booking.save
      redirect_to root_path
    else
      render :new
    end

  end

  def edit
  end

  def update
    @booking.update(booking_params)
    if @booking.update(booking_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to root_path
  end

  def ask_booking
    @booking = Booking.find(params[:format])
    @booking.status = "En attente de validation"
    @booking.save
    redirect_to my_deals_path
  end

  def accept_booking
    @booking = Booking.find(params[:format])
    @booking.status = "En attente de paiement"
    @booking.save
    redirect_to my_deals_path
  end

  def refuse_booking
    @booking = Booking.find(params[:format])
    @booking.status = "Disponible"
    @booking.save
    redirect_to my_deals_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :message, :deal_id)
  end

  def set_availability

  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
