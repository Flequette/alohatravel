class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :home_local, :joinus, :legal, :team]

  def home
  end

  def home_local
  end

  def joinus
  end

  def legal
  end

  def team
  end

  def result
    if params[:activity].present?
      @deals = Deal.near(params[:location], 50, units: :km).where(activity_type: params[:activity])
    else
      @deals = Deal.near(params[:location], 50, units: :km)
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
