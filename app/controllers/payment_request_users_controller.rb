class PaymentRequestUsersController < ApplicationController
    def update
        payment_request_user = PaymentRequestUser.where(id:params[:id])
        payment_request_user.update(status:params[:status])
        redirect_to root_path
    end
end