require 'rails_helper'

RSpec.describe EventsController, :type => :controller do

  describe 'GET #index' do

    before :each do
      3.times do
        create(:event)
      end
    end 

    it "renders the :index template" do
      
      get :index
      expect(response).to render_template :index
    end

  end   

end
