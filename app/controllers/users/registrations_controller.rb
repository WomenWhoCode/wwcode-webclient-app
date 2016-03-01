class Users::RegistrationsController < ApplicationController

  def new 

  end

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
      puts "?????????"
      puts response.code
      puts response.body
      puts response.headers
      puts "///////////"
    redirect_to "/profiles"
  end


end
