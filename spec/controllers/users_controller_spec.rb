require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET users' do
    let!(:user1) { create :user }

    it "routes to #index" do
      should route(:get, '/users').to(action: :index)
      expect(response).to have_http_status(:success)
    end

    it "routes to #show" do
      should route(:get, '/users/1').to(action: :show, id: 1)
    end
  end
end
