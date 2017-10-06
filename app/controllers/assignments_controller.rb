class AssignmentsController < ApplicationController
  
  def index
    @assignments = Assignment.all
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = current_user.assignments.build(ass_params)
    if @assignment.save
      flash[:notice] = "Assignment Created successfully."
      redirect_to assignments_path
    else
      flash[:notice] = "can't be saved."
      render 'new'
    end
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  def download_file
    @model = Assignment.find(params[:id])
    send_file(@model.avatar.path,
          :type => 'application/pdf',
          :disposition => 'attachment',
          :url_based_filename => true)
  end


  private

  def ass_params
    params.require(:assignment).permit(:name, :due_date, :start_time, :avatar)
  end
end
