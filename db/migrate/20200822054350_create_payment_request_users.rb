class CreatePaymentRequestUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_request_users do |t|
      t.references :payment_request, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
