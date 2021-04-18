FactoryBot.define do
  factory :game_title do
    game_title {'テスト'}
    game_info {'テスト'}
    recommended_pc {'テスト'}
    monthly_fee {'テスト'}
    association :user

    after(:build) do |game_title|
      game_title.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
