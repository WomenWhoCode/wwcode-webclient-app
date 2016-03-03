class Users::RegistrationsController < ApplicationController

  def new 

  end

  def create
    @new_user = Registration.create(form_data: session[:form_data], username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], access_code: params[:access_code])
    if success?(@new_user.code)
      session[:api_headers] = {"uid" => @new_user.headers[:uid], "token_type" => @new_user.headers[:token_type], "expiry" => @new_user.headers[:expiry], "client" => @new_user.headers[:client], "access_token" => @new_user.headers[:access_token], "Accept" => "application/json"}
      redirect_to "/profiles"
    else
      render :new
    end
  end

  private 

  def success?(response_code)
    /20[0-9]/ === response_code.to_s
  end  

end
