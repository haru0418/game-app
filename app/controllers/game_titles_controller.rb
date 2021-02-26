class GameTitlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_game_title, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit]

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
  end

  def edit
  end

  def update
    if @game_title.update(game_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @game_title.destroy
      redirect_to root_path
    end
  end




  private

  def game_params
    params.require(:game_title).permit(:image, :game_title, :game_info, :recommended_pc, :monthly_fee).merge(user_id: current_user.id)
  end

  def set_game_title
    @game_title = GameTitle.find(params[:id])
  end

  def move_to_index
    redirect_to root_path if @game_title.user_id != current_user.id
  end

end