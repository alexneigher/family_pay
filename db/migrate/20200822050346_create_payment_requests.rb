class CreatePaymentRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_requests do |t|

      t.string :description
      t.decimal :amount
      t.string :currency
      t.string :status

      t.references :user

      t.timestamps
    end
  end
end
