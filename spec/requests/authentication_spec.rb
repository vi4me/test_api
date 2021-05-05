require 'rails_helper'

RSpec.describe 'Authentication' do
  describe 'POST /auth' do
    let(:user) { create :user, email: 'user@example.com', password: '12345678' }

    context 'without client credentials' do
      it 'post auth' do
        post '/auth'

        expect(['created_at'].present?).to eq true
        expect(response.status).to eq 200
      end
    end
  end
end
