class PlacesController < ApplicationController

  def index
    # render :template => "place/index"
    @places = Place.all
    @entries = Entry.all
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]

    if @place.save
      redirect_to "/places"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @id = params["id"]
    @place = Place.find_by({"id" => @id})
    @entries = Entry.where({"place_id" => @id})
  end
end
