class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :home_local, :joinus]
  skip_after_action :verify_authorized

  def home
  end

  def home_local
  end

  def joinus
  end

end
