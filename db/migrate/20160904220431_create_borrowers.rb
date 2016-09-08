class CreateBorrowers < ActiveRecord::Migration[5.0]
  def change
    create_table :borrowers do |t|
      t.string  :title,               null: false
      t.decimal :amount,              null: false, precision: 12, scale: 2
      t.date    :date_of_loan,        null: false
      t.integer :term_in_months,      null: false
      t.integer :accumulation_period, null: false
      t.decimal :annual_rate,         null: false, precision: 9, scale: 6
      t.decimal :late_annual_rate,    null: false, precision: 9, scale: 6

      t.timestamps
    end
  end
end
