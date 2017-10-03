class RatingsController < ApplicationController
  def update
    byebug
    @rating = Rating.find(params[:id])
    @subject = @rating.subject
    if @rating.update_attributes(score: params[:score])
      respond_to do |format|
        format.js
      end
    end
  end
end
