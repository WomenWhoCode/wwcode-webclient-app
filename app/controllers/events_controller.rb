class EventsController < ApplicationController

# before_action :authenticate_admin!, except: [:index, :show]

  def index
    @action_is_events_index = true
    # @events=Event.all #or .where("date_time_end>?", time.now)
  end

end
