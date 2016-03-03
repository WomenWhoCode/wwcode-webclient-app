class Users::RegistrationsController < ApplicationController

  def new 

  end

  def create
    api_domain = ENV['API_DOMAIN']
    @response = Unirest.post "#{api_domain}/auth",
      headers: {"Accept" => "application/json" },
      parameters: {
        personalization_details: session[:form_data],
        username: params[:username],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation],
        access_code: params[:access_code]
      }
    if /2[0-9][0-9]/ === @response.code
      session[:api_headers] = {"uid" => @response.headers[:uid], "token_type" => @response.headers[:token_type], "expiry" => @response.headers[:expiry], "client" => @response.headers[:client], "access_token" => @response.headers[:access_token]}
      redirect_to "/profiles"
    else  
      render :new    
    end   
  end

end
