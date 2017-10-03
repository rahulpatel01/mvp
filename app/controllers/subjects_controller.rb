class SubjectsController < ApplicationController
  load_and_authorize_resource param_method: :sub_params , only: [:new, :create, :index, :update, :show]
  
  def index
    if params[:term]
      @subjects = Subject.search(params[:term])
    else
      @subjects = Subject.all
    end
  end

  def new
    @subject = Subject.new
  end

  def create
    if current_user.subjects.create(sub_params)
      redirect_to subjects_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @subject = Subject.find(params[:id])
    @rating = Rating.where(subject_id: @subject.id, user_id: current_user.id).first
    unless @rating
      @rating = Rating.create(subject_id: @subject.id, user_id: current_user.id, score: 0)
    end
  end

  def rate_update
    @rating = Rating.find(params[:id])
    @subject = @rating.subject
    if @rating.update_attributes(score: params[:score])
      respond_to do |format|
        format.js
      end
    end
  end

  def update
  end 

  def educator_courses
    @user = current_user
    @subject = @user.subjects 
  end

  private

  def sub_params
    params.require(:subject).permit(:name, :objective, :lesson_plan, :content, :avatar, :avatar_cache, :term)
  end
end
