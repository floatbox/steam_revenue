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

require 'rails_helper'

RSpec.describe MonthlyPayment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
