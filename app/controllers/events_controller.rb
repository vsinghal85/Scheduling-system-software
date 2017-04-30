class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]


  def index 
    if current_client
    @events=current_client.events.all
   end
   if current_teacher
   @events=current_teacher.clients.all.first.events.all
   @clients=current_teacher.clients.all
   @clients.each do |client|
    @events=@events.or(client.events.all)
  end
   end
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
