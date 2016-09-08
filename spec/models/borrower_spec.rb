# frozen_string_literal: true
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

require 'rails_helper'

RSpec.describe Borrower, type: :model do
  subject { create(:borrower) }

  describe 'methods' do
    it 'return correct #monthly_principal_payment' do
      expect(subject.monthly_principal_payment.round(2).to_s).to eq "166666.67"
    end

    it 'return correct #monthly_interest_payment' do
      expect(subject.monthly_interest_payment.round(2).to_s).to eq "25000.0"
    end

    it 'return correct #total_payment' do
      expect(subject.total_payment.round(2).to_s).to eq "1150000.0"
    end
  end
end
