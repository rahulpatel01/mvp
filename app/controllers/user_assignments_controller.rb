class UserAssignmentsController < ApplicationController
  def index
    @user_assignments = current_user.user_assignments.order(created_at: 'DESC')
  end

  def new
    @assignment = Assignment.find(params[:assignment_id])
    @educator = User.find(@assignment.user_id)
    @user_assignment = @assignment.user_assignments.build
  end

  def create
    @assignment = Assignment.find(params[:assignment_id])
    @user_assignment = current_user.user_assignments.build(assign_params)
    @user_assignment[:educator_id] = @assignment.user_id 
    @user_assignment[:assignment_id] = @assignment.id
    if @user_assignment.save
      flash[:notice] = "successfully submmitted"
      redirect_to assignment_user_assignments_path
    else
      flash[:notice] = "can not be submitted"
      render 'new'
    end
  end

  private

  def assign_params
    params.require(:user_assignment).permit(:user_id, :assignment_id, :educator_id, :description, :avatar)
  end
end
