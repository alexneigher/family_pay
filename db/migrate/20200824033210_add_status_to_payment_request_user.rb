class AddStatusToPaymentRequestUser < ActiveRecord::Migration[5.2]
  def change
    add_column :payment_request_users, :status, :string
  end
end
