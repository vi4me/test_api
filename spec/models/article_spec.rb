require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'valid' do
    it 'validates presence' do
      should validate_presence_of :title
      should validate_presence_of :body
    end

    it 'has_many' do
      should have_many(:comments).dependent(:destroy)
    end

    it 'length of title' do
      should validate_length_of(:title).is_at_most(100)
    end

    it 'belongs to user' do
      should belong_to(:user)
    end
  end

  context 'invalid' do
    it "without attributes" do
      expect(Article.new).to be_invalid
    end
  end
end
