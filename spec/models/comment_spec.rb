require 'rails_helper'

RSpec.describe Comment, type: :model do

  it 'validates presence' do
    should validate_presence_of :body
  end

  it 'length of body' do
    should validate_length_of(:body).is_at_most(1000)
  end

  it 'belongs to user' do
    should belong_to(:article)
    should belong_to(:user)
  end
end
