require 'rails_helper'

RSpec.describe Category, type: :model do

  it 'has_many' do
    should have_many(:articles).dependent(:destroy)
  end
end
