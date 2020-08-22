class PaymentRequestUser < ApplicationRecord
  belongs_to :payment_request
  belongs_to :user
end
