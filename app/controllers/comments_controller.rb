class CommentsController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @comments = @question.comments
  end

  def create
    @question = Question.find(params[:question_id])
    @comment = @question.comments.build(com_params)
    @comment[:user_id] = current_user.id
    if @comment.save
      redirect_to :back
    else
      render 'new'
    end
  end

  private

  def com_params
    params.require(:comment).permit(:answer)
  end
end
