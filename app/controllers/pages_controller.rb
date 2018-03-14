class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :home_local]

  def home
  end

  def home_local
  end

end
