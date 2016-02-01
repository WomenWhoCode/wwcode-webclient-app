class EventsController < ApplicationController

  # before_action authenticate_admin!, except: [:index]

  def index
    @events=Event.all #or .where("date_time_end>?", time.now)
  end

end
