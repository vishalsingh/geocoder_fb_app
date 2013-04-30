class LocationsController < ApplicationController
  # GET /locations
  # GET /locations.json
  def index

#@graph = Koala::Facebook::API.new('BAACEdEose0cBAOndIZCjcaTGliFZBWIMRDpuOvdW8hPHiWR15a01jTuTIfJGScE1lzbpjDMBWdNZBQVySazBdh3vl9Oo86dk40a2zRrE3C1xM6rxqghJaxnKgh3gbm3ZAQiWP9utcv0YGWebRYIMvOptIyCU8X5bIuPutHFYYHiP92ZADPTZC7i5vQOjYD4LDVPOy0TO4iTCLKHec7UljToPBFYDfqgFCZCSgrB99A1LREpdjwEaZBse')
#@hello = @graph.get_object("my.Name")
#render :text=>'<pre>' + @hello.to_yaml and return
#@graph = Koala::Facebook::API.new('BAACEdEose0cBAFUHbYr2brBqwStJq42VlGXZAi10CwqZCoSP1PC7AAfwzkGHEwv8j5YRklCEIXo7cgPbrQcZCVeVpNtXtb20QhOAcrHIzZArmoSpxmIFZB6pnFMsiGdE065WNYTlnxJnV3MXZAm1rCdGcgCIhOREZByr9Mcq4cKObQlPOVpXZAS1vgfJktiNROULr27mhxEroAyu7B0fl9EoTcKQcOmvasHWHbjsd4rkdQZDZD')

#profile = @graph.get_object("me")
#friends = @graph.get_connections("me", "friends")
# render :text=>'<pre>' + friends.to_yaml and return
if params[:search].present?
    @locations = Location.near(params[:search], 50, :order => :distance)
  else
    @locations = Location.all
  end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.json
  def new
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(params[:location])

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: "new" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.json
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end


end
