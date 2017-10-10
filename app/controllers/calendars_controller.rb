class CalendarsController < ApplicationController
  
  def index
    @calendars = Calendar.all
    @subjects = Subject.all
  end

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.new(cal_params)
    if @calendar.save
      redirect_to calendars_path
    else 
      render 'new'
    end
  end

  def show
    @calendar = Calendar.find(params[:id])
  end

  private

  def cal_params
    params.require(:calendar).permit(:name, :start_time, :end_time)
  end
end
