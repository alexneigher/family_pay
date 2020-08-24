class PaymentRequest < ApplicationRecord
  belongs_to :requestor, class_name: 'User', primary_key: 'id', foreign_key: "user_id"
  has_many :payment_request_users
  has_many :approvers, through: :payment_request_users, source: :user

  def self.without_status
    self.joins(:payment_request_users).where(payment_request_users:{status:nil}).uniq
  end

end
