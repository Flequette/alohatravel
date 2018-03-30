class DealsController < ApplicationController
  before_action :set_deal, only: [:show, :edit, :update, :destroy]

  def index
    #@deals = Deal.where.not(latitude: nil, longitude: nil) => dans /deal_policy.rb
    @deals = policy_scope(Deal)

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
      authorize @deal
    else
      redirect_to new_user_session_path
    end
  end

  def create
    #@deal = Deal.new(deal_params)
    #@deal.profile = current_user.profile
    @deal = current_user.deals.build(deal_params)
    authorize @deal
    if @deal.save
      redirect_to deal_path(@deal)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @deal.update(deal_params)
    if @deal.update(deal_params)
      redirect_to deal_path(@deal)
    else
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
    authorize @deal
  end

end
