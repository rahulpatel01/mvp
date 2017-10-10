class AssignmentsController < ApplicationController
  
  def index
    @assignments = Assignment.all
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = current_user.assignments.build(assign_params)
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
    send_file(
        @model.avatar.path,
        type: "application/pdf"
      )
  end

  def submitted_assignment
    @assignments = UserAssignment.where(educator_id: current_user.id)
  end

  private

  def assign_params
    params.require(:assignment).permit(:name, :due_date, :start_time, :avatar)
  end
end
