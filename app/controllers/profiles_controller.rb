class ProfilesController < ApplicationController

  def index
    @networks = Network.all
  end

  

end