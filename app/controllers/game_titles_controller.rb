class GameTitlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @game_title = GameTitle.includes(:user)
  end

  def new
    @game_title = GameTitle.new
  end

  def create
    @game_title = GameTitle.new(game_params)
    if @game_title.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @game_title = GameTitle.find(params[:id])
  end

  def edit
    @game_title = GameTitle.find(params[:id])
  end

  def update
    @game_title = GameTitle.find(params[:id])
    if @game_title.update(game_params)
      redirect_to root_path
    else
      render :edit
    end
  end




  private

  def game_params
    params.require(:game_title).permit(:image, :game_title, :game_info, :recommended_pc, :monthly_fee).merge(user_id: current_user.id)
  end

end