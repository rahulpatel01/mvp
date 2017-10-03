require 'paypal-sdk-merchant'

class DonatesController < ApplicationController
  def index
  end

  def new
    @donate = Donate.new
  end

  def create
    @paypal = DonatesService.new
    response = @paypal.invoice(params)
    @donate = current_user.donates.build(donate_params)
    if response.success?
      @donate.save
      redirect_to donate_path(@donate.id)
    else
      render 'new'
    end
  end

  def show
    @donate = Donate.find(params[:id])
  end

  private

  def donate_params
    params.require(:donate).permit(:amount_type, :amount, :CreditCardType, :CreditCardNumber, :ExpMonth, :ExpYear, :CVV)
  end
end
