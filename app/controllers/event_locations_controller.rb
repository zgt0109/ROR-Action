class EventLocationsController < ApplicationController
  before_action :find_event
  before_action :find_event_location, :only => [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @location = @event.build_location
  end

  def create
    @location = @event.build_location(location_params)
    if @location.save
      redirect_to event_location_url(@event)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to event_location_url(@event)
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to event_location_url(@event)
  end

  protected
    def find_event
      @event =Event.find(params[:event_id])
    end

    def find_event_location
      @location = @event.location
    end

    def location_params
      params.require(:location).permit(:name)
    end
end
