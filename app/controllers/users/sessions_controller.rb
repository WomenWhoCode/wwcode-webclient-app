class Users::SessionsController < ApplicationController

  def new 

  end

  def create
    @new_session = Session.create(email: params[:email], password: params[:password])
    if success?(@new_session.code)
      session[:api_headers] = {"uid" => @new_session.headers[:uid], "token_type" => @new_session.headers[:token_type], "expiry" => @new_session.headers[:expiry], "client" => @new_session.headers[:client], "access_token" => @new_session.headers[:access_token], "Accept" => "application/json"}
      redirect_to "/profiles"
    else  
      render :new    
    end 
  end

  def destroy
    Session.destroy(session[:api_headers])
    session[:api_headers] = nil
    redirect_to "/"
  end

  private 

  def success?(response_code)
    /20[0-9]/ === response_code.to_s
  end  

end
