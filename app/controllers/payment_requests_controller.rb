class PaymentRequestsController < ApplicationController

  def index
    @payment_requests_i_created = current_user.payment_requests_as_requestor

    @payment_requests_needing_my_approval = current_user.payment_requests_as_approver.without_status
  end

  def new
  end

  def create
    approver_ids = params[:payment_request][:approvers]
    has_two_approvers = approver_ids.present? && approver_ids.length >= 2
    if has_two_approvers
      payment_request = current_user.payment_requests_as_requestor.create(payment_request_params)
      params[:payment_request][:approvers].each do |id|
        user = User.find(id)
        payment_request.approvers << user
      end
    else
      flash[:error] = "You need at least 2 approvers"
    end

    redirect_to root_path
  end


  private
    def payment_request_params
      params.require(:payment_request).permit(:description, :amount)
    end

end
