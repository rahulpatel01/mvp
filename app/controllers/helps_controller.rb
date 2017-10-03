class HelpsController < ApplicationController
  def index
  end

  def new
    @help = Help.new
  end

  def create
    @help = Help.new(helo_params)
    @help.save
  end

  def find_course
  end
  
  def message_to_instructor
  end

  def video_playback
  end

  def failed_purchase
  end

  private

  def helo_params
    params.require(:help).permit(:user_type, :learn, :level_type, :goal, :email, :description, :avatar)
  end
end
