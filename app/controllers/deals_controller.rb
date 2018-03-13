class DealsController < ApplicationController
  before_action :set_deal, only: [:show, :edit, :update, :destroy]

  def index
    @deals = Deal.all
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
    @deal = Deal.new(deal_params)
    @deal.profile = current_user.profile
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
    params.require(:deal).permit(:name, :description, :location, :price, :photo)
  end

  def set_deal
    @deal = Deal.find(params[:id])
  end

end
