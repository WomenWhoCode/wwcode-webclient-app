class UserAccountsController < ApplicationController


  def sign_up

  end

  def sign_in

  end
  
  def create
  end

  def new
    Unirest.post "http://localhost:3000/auth",
      headers: {"Accept" => "application/json" },
      parameters: {
        # :personalization_details => session[:form_data],
        # :username => params[:username],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation]
        # :access_code => params[:access_code]
      }
      redirect_to "/profiles"
  end

end
