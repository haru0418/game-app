class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  has_many :game_titles
  has_many :comments
  has_many :favorites, dependent: :destroy

  def already_favorited?(game_title)
    self.favorites.exists?(game_title_id: game_title.id)
  end
end
