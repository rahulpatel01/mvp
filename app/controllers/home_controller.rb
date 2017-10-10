class HomeController < ApplicationController
  def index
    if params[:search]
      @subjects = Subject.search(params[:search]).order("created_at ASC")
    else  
      @subjects = Subject.all.order("created_at ASC")
    end
  end

  def show
  end

  def video
  end

  def about
  end

  def all_educator
    @educators = User.where(role: "educator")
  end

  def dashboard_page
  end

  def learner_dashboard
  end

  def educator_dashboard
  end

  def user_profile
    @user = User.find(params[:id])
  end
end
