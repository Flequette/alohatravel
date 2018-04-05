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

  end

  def new
    if current_user
      @deal = Deal.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @location = request.location
    @deal = Deal.new(deal_params)
    @deal.profile = current_user.profile

    distance = Geocoder::Calculations.distance_between(@location.coordinates, [@deal.latitude, @deal.longitude])
    puts distance

    if @deal.save
      redirect_to deal_path(@deal)
    else
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

    @location = request.location
    distance = Geocoder::Calculations.distance_between(@location.coordinates, [@deal.latitude, @deal.longitude])
    puts distance


    if @deal.update(deal_params)
      redirect_to deal_path(@deal)
    else
      flash[:alert] = "You must be at 50km of the deal address, Please change your deal location or be closer"
      render :new
    end
  end

  def destroy
    @deal.destroy
    redirect_to deals_path
  end

  private

  def deal_params
    params.require(:deal).permit(:name, :description, :price, :address, :city, :zip_code, :country_code, :country, :inhabitant, :activity_type, :time, :photo, :profile_id)
  end

  def set_deal
    @deal = Deal.find(params[:id])
  end

end
