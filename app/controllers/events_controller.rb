class EventsController < ApplicationController
  before_action :set_event, :only => [:show, :edit, :update, :destroy]

  def index
    @events = Event.page(params[:page]).per(5)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to :action => :index
      flash[:notice] = "event was successfully created"
    else
      render :action => :new
    end
  end

  def show
    @page_title = @event.name
  end

  def update
    if @event.update(event_params)
      redirect_to :action => :show, :id => @event
      flash[:notice] = "event was successfully updated"
    else
      render :action => :edit
    end
  end

  def edit
  end

  def destroy
    @event.destroy
    flash[:alert] = "event was successfully deleted"
    redirect_to :action => :index
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :description)
    end
end
