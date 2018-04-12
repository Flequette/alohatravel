class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :home_local, :joinus]

  def home
  end

  def home_local
  end

  def joinus
  end

  def result
    @deals = Deal.near(params[:location], 50, units: :km).where(activity_type: params[:activity])
    @markers = @deals.map do |deal|
      {
        lat: deal.latitude,
        lng: deal.longitude#,
        # infoWindow: { content: render_to_string(partial: "/deals/map_box", locals: { deal: deal }) }
      }
    end
  end

end
