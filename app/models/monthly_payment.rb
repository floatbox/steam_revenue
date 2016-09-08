# frozen_string_literal: true
# == Schema Information
#
# Table name: monthly_payments
#
#  id              :integer          not null, primary key
#  borrower_id     :integer
#  payment_month   :date             not null
#  annual_rate     :decimal(9, 6)    not null
#  amount          :decimal(12, 2)   not null
#  interest_amount :decimal(12, 2)   not null
#  late_payment    :boolean          default(FALSE), not null
#  early_repayment :boolean          default(FALSE), not null
#  payment_date    :date             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class MonthlyPayment < ApplicationRecord

  belongs_to :borrower

  def principal_amount
    amount - interest_amount
  end

end
