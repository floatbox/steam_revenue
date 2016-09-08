class CreateMonthlyPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :monthly_payments do |t|
      t.references :borrower,        foreign_key: true
      t.date       :payment_month,   null: false
      t.decimal    :annual_rate,     null: false, precision: 9, scale: 6
      t.decimal    :amount,          null: false, precision: 12, scale: 2
      t.decimal    :interest_amount, null: false, precision: 12, scale: 2
      t.boolean    :late_payment,    null: false, default: false
      t.boolean    :early_repayment, null: false, default: false
      t.date       :payment_date,    null: false

      t.timestamps
    end
  end
end
