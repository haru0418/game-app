class Favorite < ApplicationRecord

  belongs_to :game_title
  belongs_to :user

  validates_uniqueness_of :game_title_id, scope: :user_id

end
