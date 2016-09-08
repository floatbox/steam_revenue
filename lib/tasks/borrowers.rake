# frozen_string_literal: true
namespace :borrowers do
  desc 'Load borrowers from table'
  task load: :environment do
    Borrower.create(
      title: 'ЮЛ1',
      amount: 1_000_000,
      date_of_loan: Time.zone.local(2016, 1, 1).to_datetime,
      term_in_months: 6,
      accumulation_period: 1,
      annual_rate: 0.3,
      late_annual_rate: 0.5
    )
  end
end
