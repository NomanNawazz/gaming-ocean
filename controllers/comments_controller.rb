class CommentsController < ApplicationController
  def index
    @comments = Comments.all
  end

  def show
  end

  def create
    @game = Game.find params[:comment][:game_id]
    @comment = @game.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to game_url(@game), notice: "Comment was successfully posted." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end


  private

  def comment_params
    params.require(:comment).permit(:content, :game_id, :user_id)
  end
end
