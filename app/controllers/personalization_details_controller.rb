class PersonalizationDetailsController < ApplicationController

  def index

  end

  def create
    hopes = format_hash_data(params[:hopes])
    interests = format_hash_data(params[:interests])
    experience = format_array_data([params[:experience], params[:ExperiencesOther]])
    session[:form_data] = {hopes: hopes, interests: interests, experience: experience}
    puts session[:form_data]
    redirect_to "/users/sign_up"
  end

  private

  def format_hash_data(hash)
    array = []
    hash.each do |k, v|
      if k.include? "Other"
        if v != ""
          array << v
        end
      else
        array << k
      end   
    end
    return array  
  end

  def format_array_data(array)
    output_array = []
    array.each do |element|
      if element != "" && element != nil
        output_array << element
      end
    end
    return output_array
  end
  
end
