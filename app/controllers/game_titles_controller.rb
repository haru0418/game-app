class GameTitlesController < ApplicationController

  def index
  end

  def new
    @game_title = GameTitle.new
  end
end
