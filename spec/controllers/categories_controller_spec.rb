require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  describe "routing" do
    let!(:category) { create_list(:category, 2) }

    it "routes to #index" do
      get :index

      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      should route(:get, '/categories').to(action: :index)
    end

    it "routes to #show" do

      should route(:get, '/categories/1').to(action: :show, id: 1)
    end

    it 'permit' do
      params = { category: { title: 'John' } }
      should permit(:title).for(:create, params: params).on(:category)
    end
  end
end
