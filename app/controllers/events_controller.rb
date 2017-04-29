class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
 before_action :authenticate_client!, except: [:show]

  def index
    @events = current_client.events.all
  end

  def show
  end

  def new
   # @event = Event.new
    @event = current_client.events.build
  end

  def edit
  end

  def create
    @event = current_client.events.build(event_params)
    @event.save
  end

  def update
    @event.update(event_params)
  end

  def destroy
    @event.destroy
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date_range, :start, :end, :color)
    end
end
