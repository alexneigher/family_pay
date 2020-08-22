class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :payment_requests_as_requestor, class_name: 'PaymentRequest', foreign_key: 'user_id'

  has_many :payment_request_users
  has_many :payment_requests_as_approver, through: :payment_request_users, source: :payment_request
end
