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
end
