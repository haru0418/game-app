class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to game_title_path(@comment.game_title)
    else
      @game_title = @comment.game_title
      @comments = @game_title.comments
      render "game_titles/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, game_title_id: params[:game_title_id] )
  end
end
