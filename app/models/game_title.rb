class GameTitle < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :game_title
    validates :game_info
    validates :recommended_pc
    validates :monthly_fee
  end

  belongs_to :user
end
