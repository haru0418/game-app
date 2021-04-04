FactoryBot.define do
  factory :user do
    nickname { '田中' }
    email { 'test@example' }
    password { 'test12' }
    password_confirmation { password }
  end
end
