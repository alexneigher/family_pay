class PaymentRequestsController < ApplicationController

  def index
    @payment_requests_i_created = current_user.payment_requests_as_requestor

    @payment_requests_needing_my_approval = current_user.payment_requests_as_approver
  end

  def new
  end

  def create
    payment_request = current_user.payment_requests_as_requestor.create(payment_request_params)
    params[:payment_request][:approvers].each do |id|
      user = User.find(id)
      payment_request.approvers << user
    end

    redirect_to root_path
  end


  private
    def payment_request_params
      params.require(:payment_request).permit(:description, :amount)
    end

end
