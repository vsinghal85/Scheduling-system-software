class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]


  def index 
    
    if current_teacher and current_teacher.admin and params[:client_id]!=nil
       
      client=Client.find(params[:client_id])
     @events=client.events.all
     gon.my_var=@events
    # render json:@events.as_json()
     #return redirect_to root_path
       # index.html.erb
    end    

    if current_client
    @events=current_client.events.all
   end
   
   if current_teacher and @events==nil 
    
   @events=current_teacher.clients.all.first.events.all
   @clients=current_teacher.clients.all
   @clients.each do |client|
    @events=@events.or(client.events.all)
  

  end
  

   end
   gon.my_var=@events
    end  
    

    

  

  def show

    if current_teacher and current_teacher.admin and params[:client_id]!=nil
       
      client=Client.find(params[:client_id])
    @events=client.events.all
    end    

    respond_to do |format|
    
    format.json { render json: @events.as_json() }
    end

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
    if(!current_teacher)
    @event.update(event_params)
  end
  end

  def destroy
    if(!current_teacher)
    @event.destroy
  end
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      #params.require(:event).permit(:title, :date_range, :start, :end, :color)
      params.require(:event).permit( :title, :date_range, :start, :end, :color,schedule_attributes: Schedulable::ScheduleSupport.param_names)
    end
end
