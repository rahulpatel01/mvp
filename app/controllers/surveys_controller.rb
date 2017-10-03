class SurveysController < ApplicationController
  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to educator_video_path
    else
      flash[:notice] = "can't be saved your survey"
      render 'new'
    end
  end

  def educator_video
  end

  private

  def survey_params
    params.require(:survey).permit(:category, :experience, :bubble_option, :media, :skills, :reason)
  end
end
