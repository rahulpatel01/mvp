class QuestionsController < ApplicationController
  def index
    if current_user.role == "educator"
      @questions = Question.all
    else
      @questions = current_user.questions
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(que_params)
    if @question.save
      redirect_to questions_path
    else
      render 'new'
    end
  end

  private
  def que_params
    params.require(:question).permit(:question,:user_id)
  end
end
