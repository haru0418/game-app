FactoryBot.define do
  factory :comment do
    text {'テスト'}
    association :user
    association :game_title
  end
end
