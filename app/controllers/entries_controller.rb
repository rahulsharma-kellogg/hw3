class EntriesController < ApplicationController
  def new
    @entry = Entry.new
    @place = Place.find_by({"id" => params["place_id"]})
  end

  def create
    @place_id = params["place_id"]
    @entry = Entry.new
    @entry["place_id"] = @place_id
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]

    if @entry.save
      redirect_to "/places/#{@place_id}"
    else
      @place = Place.find_by({"id" => @place_id})
      render :new, status: :unprocessable_entity
    end
  end
end
