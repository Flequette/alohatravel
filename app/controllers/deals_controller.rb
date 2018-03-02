class DealsController < ApplicationController
  before_action :set_deal, only:[:new, :edit]

  def index
    @deals = Deal.all
  end

  def show

  end

  def new
    @deal = Deal.new
  end

  def create
    @deal = Deal.new(deal_params)
    if @deal.save
      redirect_to deal_path(@deal)
    else
      render :new
    end
  end

  def edit
  end

  def update

  end

  def delete

  end


  private

  def deal_params
    params.require(:deal).permit(:name, :photo, :photo_cache)
  end

  def set_deal
    @deal = Deal.find(params[:id])
  end

end
