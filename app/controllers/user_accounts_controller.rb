class UserAccountsController < ApplicationController


  def sign_up

  end

  def sign_in

  end
  
  #you have two "create's here, one for the session, and one for the registration. To keep things more clean, I would create two controllers (registrations and sessions) to mimic the api. That way, you can have two "create"s and not have to break REST.

  # def create
  #   response = Unirest.post "http://localhost:3000/auth",
  #     headers: {"Accept" => "application/json" },
  #     parameters: {
  #       email: params[:email],
  #       password: params[:password],
  #       password_confirmation: params[:password_confirmation]
  #     } 
  #   puts "coolness"
  #   p response.body
  #   redirect_to "/profiles"  
  # end

  def create
    response = Unirest.post "http://localhost:3000/auth",
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
