require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe "routing" do
    let!(:article) { create_list(:article, 2) }

    it "routes to #index" do
      get :index

      should route(:get, '/articles').to(action: :index)
      expect(response).to have_http_status(:success)
      expect(article.count).to eq(2)
    end

    it "routes to #show" do
      should route(:get, '/articles/1').to(action: :show, id: 1)
    end

    # context 'POST #create' do
    #   subject { post :create, params: params }
    #
    #   it 'save the item' do
    #     expect { subject }.to change(Article, :count).by 1
    #   end
    # end
  end
end
