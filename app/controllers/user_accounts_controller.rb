class UserAccountsController < ApplicationController


  def sign_up

  end

  def sign_in

  end
  
  def create
    response = Unirest.post "http://staging-wwcode-api.herokuapp.com/auth/sign_in",
      headers: {"Accept" => "application/json" },
      parameters: {
        email: params[:email],
        password: params[:password]
      } {|response|
        response.headers
      }  
    redirect_to "/profiles"  
  end

  def new
    response = Unirest.post "http://staging-wwcode-api.herokuapp.com/auth",
      headers: {"Accept" => "application/json" },
      parameters: {
        personalization_details: session[:form_data],
        username: params[:username],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation],
        access_code: params[:access_code]
      }
    redirect_to "/profiles"   
  end

end
