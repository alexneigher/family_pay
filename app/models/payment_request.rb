class PaymentRequest < ApplicationRecord
  belongs_to :requestor, class_name: 'User', primary_key: 'id', foreign_key: "user_id"
  has_many :payment_request_users
  has_many :approvers, through: :payment_request_users, source: :user

end
