class DealsController < ApplicationController
  before_action :set_deal, only: [:show, :edit, :update, :destroy]

  def index
    @deals = Deal.where.not(latitude: nil, longitude: nil)
    @markers = @deals.map do |deal|
      {
        lat: deal.latitude,
        lng: deal.longitude#,
        # infoWindow: { content: render_to_string(partial: "/deals/map_box", locals: { deal: deal }) }
      }
    end
  end

  def show
    @booking = Booking.new
    @booking.deal_id = params[:id]
  end

  def my_deals
    if current_user.profile.present?
      @deals = Deal.where(profile_id: current_user.profile.id)
      @bookings = Booking.where(profile_id: current_user.profile.id)
    else
      redirect_to new_profile_path
    end
  end

  def new
    if current_user.profile.present?
      @deal = Deal.new
    else
      redirect_to new_profile_path
    end
  end

  def create
    @deal = Deal.new(deal_params)
    @deal.profile = current_user.profile
    location = Geocoder.coordinates(@deal.profile.city)
    sleep 1
    distance = Geocoder::Calculations.distance_between(location, Geocoder.coordinates(@deal.address))
    sleep 1
    puts "ADRESSSE PROFILE"
    puts location
    puts "ADRESSE DEAL"
    puts Geocoder.coordinates(@deal.address)
    puts "DISTANCE"
    puts distance


    if @deal.valid?
      @deal.save
      redirect_to deal_path(@deal)
    else
      flash[:alert] = "Erreur"
      render :new
    end
  end

  def edit
    if @deal.profile_id != current_user.profile.id
      redirect_to root_path
    end
  end

  def update
    @deal.update(deal_params)

    location = Geocoder.coordinates(@deal.profile.city)
    sleep 1
    distance = Geocoder::Calculations.distance_between(location, Geocoder.coordinates(@deal.address))
    sleep 1
    puts "ADRESSSE PROFILE"
    puts location
    puts "ADRESSE DEAL"
    puts Geocoder.coordinates(@deal.address)
    puts "DISTANCE"
    puts distance

    if @deal.update(deal_params)
      redirect_to deal_path(@deal)
    else
      flash[:alert] = "Vous devez vivre à moins de 100km du lieu de votre tour pour pouvoir le proposer"
      render :new
    end
  end

  def destroy
    @deal.destroy
    redirect_to deals_path
  end

  private

  def deal_params
    params.require(:deal).permit(:name, :description, :price, :address, :city, :zip_code, :country_code, :country, :inhabitant, :activity_type, :time, :photo, :profile_id, :tips)
  end

  def set_deal
    @deal = Deal.find(params[:id])
  end

end
