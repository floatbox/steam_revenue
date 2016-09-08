# == Schema Information
#
# Table name: borrowers
#
#  id                  :integer          not null, primary key
#  title               :string           not null
#  amount              :decimal(12, 2)   not null
#  date_of_loan        :date             not null
#  term_in_months      :integer          not null
#  accumulation_period :integer          not null
#  annual_rate         :decimal(9, 6)    not null
#  late_annual_rate    :decimal(9, 6)    not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

FactoryGirl.define do
  factory :borrower, class: 'Borrower' do
    title 'ЮЛ1'
    amount 1_000_000
    date_of_loan Time.zone.local(2016, 1, 1).to_datetime
    term_in_months 6
    accumulation_period 1
    annual_rate 0.3
    late_annual_rate 0.5
  end
end
