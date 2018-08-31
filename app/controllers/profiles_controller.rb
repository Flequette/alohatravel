class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.valid?
      @profile.save
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end



  def edit
    if @profile.id != current_user.profile.id
      redirect_to root_path
    end
  end

  def update
    @profile.update(profile_params)
    redirect_to profile_path(@profile)
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :age, :phone_number, :description, :country, :city, :language, :user_id, :photo, :photo_cache, :why_guide)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

end
