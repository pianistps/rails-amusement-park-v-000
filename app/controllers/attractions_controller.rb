class AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render ':new'
    end
  end

  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  def ride
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
    ride = @attraction.rides.new(user: @user)
    result = ride.take_ride
    redirect_to @user, notice: result
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render ':edit'
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
