class Users::SessionsController < ApplicationController

  def new 

  end

  def create
    api_domain = ENV['API_DOMAIN']
    @response = Unirest.post "#{api_domain}/auth/sign_in",
      headers: {"Accept" => "application/json" },
      parameters: {
        email: params[:email],
        password: params[:password]
      } 
    puts "????????????????"
    puts @response.code
    puts @response.body  
    puts @response.headers  
    if /2[0-9][0-9]/ === @response.code.to_s
      session[:api_headers] = {"uid" => @response.headers[:uid], "token_type" => @response.headers[:token_type], "expiry" => @response.headers[:expiry], "client" => @response.headers[:client], "access_token" => @response.headers[:access_token]}
      redirect_to "/profiles"
    else  
      render :new    
    end 
  end

  def destroy
    puts "Does this post?"
    api_domain = ENV['API_DOMAIN']
    @response = Unirest.delete "#{api_domain}/auth/sign_out",
      headers: {"Accept" => "application/json",
                "uid" => session[:api_headers]["uid"],
                "token_type" => session[:api_headers]["token_type"],
                "expiry" => session[:api_headers]["expiry"],
                "client" => session[:api_headers]["client"],
                "access_token" => session[:api_headers]["access_token"]
      }
    puts @response.body
    puts @response.headers
    session[:api_headers] = nil
    redirect_to "/"
  end

end
