class Users::SessionsController < ApplicationController

  def new 

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
      puts "?????????"
      puts response.code
      puts response.body
      puts response.headers
      puts "///////////"
    redirect_to "/profiles" 
  end

end
