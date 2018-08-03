class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :home_local, :joinus, :legal, :contact, :team, :help, :peetayer, :peetaguide]

  def home
  end

  def home_local
  end

  def joinus
  end

  def legal
  end

  def contact
  end

  def team
  end

  def help
  end

  def peetayer
  end

  def peetaguide
  end

  def result
    if params[:activity].present?
      @deals = Deal.near(params[:location], 2000, units: :km).where(activity_type: params[:activity])
    else
      @deals = Deal.near(params[:location], 2000, units: :km)
    end
    @markers = @deals.map do |deal|
      {
        lat: deal.latitude,
        lng: deal.longitude#,
        # infoWindow: { content: render_to_string(partial: "/deals/map_box", locals: { deal: deal }) }
      }
    end
  end

end
