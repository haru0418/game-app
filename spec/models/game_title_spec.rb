require 'rails_helper'

RSpec.describe GameTitle, type: :model do
  before do
    @game_title = FactoryBot.build(:game_title)
  end

  describe '投稿できる場合' do
    it 'すべての情報があれば登録できる' do
      expect(@game_title).to be_valid
    end
  end

  describe '投稿できない場合' do
    it 'imageがなければ投稿できない' do
      @game_title.image = nil
      @game_title.valid?
      expect(@game_title.errors.full_messages).to include("Image can't be blank")
    end
    it 'game_titleがなければ投稿できない' do
      @game_title.game_title = nil
      @game_title.valid?
      expect(@game_title.errors.full_messages).to include("Game title can't be blank")
    end
    it 'game_infoがなければ投稿できない' do
      @game_title.game_info = nil
      @game_title.valid?
      expect(@game_title.errors.full_messages).to include("Game info can't be blank")
    end
    it 'recommended_pcがなければ投稿できない' do
      @game_title.recommended_pc = nil
      @game_title.valid?
      expect(@game_title.errors.full_messages).to include("Recommended pc can't be blank")
    end
    it 'monthly_feeがなければ投稿できない' do
      @game_title.monthly_fee = nil
      @game_title.valid?
      expect(@game_title.errors.full_messages).to include("Monthly fee can't be blank")
    end
  end
end
