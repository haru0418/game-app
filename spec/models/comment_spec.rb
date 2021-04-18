require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメントできる場合' do
    it 'ユーザーがログインしている時はコメントができる' do
      expect(@comment).to be_valid
    end
  end
end
