class ProfilesController < ApplicationController

  def index
    @networks = Network.all
    @profiles = Profile.all
    puts "??????"
    puts session[:api_headers]
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def create
    @profile = Program.create(full_name: params[:full_name],
      image_url: params[:image_url],
      job_title: params[:job_title],
      latitude: params[:latitude],
      longitude: params[:longitude],
      network_id: params[:network_id],
      photo: params[:photo],
      theme_type: params[:theme_type],
      user_id: params[:user_id])
    redirect_to "/profiles/#{profile.id}"
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def search
    search_params = params[:search_params]
    @profiles = Profile.search(search_params)
    if @profiles.empty?
      flash[:notice] = "Your search returned no results."
    end
    render :index
  end

  def update
    @profile = Program.find(params[:id])
      if @profile.update(full_name: params[:full_name],
        image_url: params[:image_url],
        job_title: params[:job_title],
        latitude: params[:latitude],
        longitude: params[:longitude],
        network_id: params[:network_id],
        photo: params[:photo],
        theme_type: params[:theme_type],
        user_id: params[:user_id])
        redirect_to "/profiles/#{profile.id}"
      else
        redirect_to "/"
      end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
  end

end