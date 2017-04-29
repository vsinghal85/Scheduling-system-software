class VisitorsController < ApplicationController
	 before_action :authenticate_client!
  def index
  	@client=current_client
  end
end
