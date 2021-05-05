require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET users' do
    let!(:user1) { create :user }

    it "routes to #index" do
      get :index

      should route(:get, '/users').to(action: :index)
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it "routes to #show" do

      should route(:get, '/users/1').to(action: :show, id: 1)
    end

    # it 'returns Users' do
    #   get '/users'
    #
    #   expect(['users']).to match_array(1)
    #   expect(response.status).to eq 200
    # end
  end
end
