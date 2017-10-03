class DonatesService
  def invoice(params)
    result = {}
    @api = PayPal::SDK::Merchant.new
    puts "===================================================================="
    puts PayPal::SDK.configure.username
    puts PayPal::SDK.configure.password
    puts PayPal::SDK.configure.signature
    puts "===================================================================="

    @do_direct_payment = @api.build_do_direct_payment({
      :DoDirectPaymentRequestDetails => {
        :PaymentAction => "Sale",
        :PaymentDetails => {
         :OrderTotal => {
           :currencyID => "USD",
           :value => params[:donate][:amount]},
          :NotifyURL => "localhost:3000" },
        :CreditCard => {
         :CreditCardType => params[:donate][:CreditCardType],
         :CreditCardNumber => params[:donate][:CreditCardNumber],
         :ExpMonth =>  params[:donate][:ExpMonth],
         :ExpYear =>  params[:donate][:ExpYear],
         :CVV2 =>  params[:donate][:CVV]
        }
      }
    })
    @response = @api.do_direct_payment(@do_direct_payment)
    @response
  end
end