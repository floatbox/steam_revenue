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

class Borrower < ApplicationRecord

  has_many :monthly_payments

  ## ежемесячный платеж по долгу
  def monthly_principal_payment
    amount / term_in_months
  end

  ## ежемесячный платеж по процентам
  def monthly_interest_payment
    amount * annual_rate / 12
  end

  ## ежемесячный платеж по процентам с просрочкой
  def monthly_late_interest_payment
    amount * late_annual_rate / 12
  end

  ## общий ежемесячный платеж
  def monthly_payment_total
    monthly_principal_payment + monthly_interest_payment
  end

  ## общая ожидаемая сумма выплаты
  def total_payment
    monthly_payment_total * term_in_months
  end

  ## реальная сумма ежемесячных выплат
  def monthly_payments_sum
    monthly_payments.sum(:amount)
  end

  ## реальная сумма ежемесячных выплат по ОД
  def monthly_payments_principal_sum
    monthly_payments_sum - monthly_payments_interest_sum
  end

  ## реальная сумма ежемесячных выплат по процентам
  def monthly_payments_interest_sum
    monthly_payments.sum(:interest_amount)
  end

  ## остаток кредитной задолженности
  def loan_balance
    amount - monthly_payments_principal_sum
  end

  def create_monthly_payment(payment_month: false, late_payment: false, early_repayment: false)
    payment_date = DateTime.now.in_time_zone
    payment_month = payment_date.beginning_of_month unless payment_month
    monthly_payments.create(
      payment_month: payment_month,
      annual_rate: payment_annual_rate(late_payment: late_payment),
      amount: payment_amount(late_payment: late_payment, early_repayment: early_repayment),
      interest_amount: payment_interest_amount(late_payment: late_payment),
      late_payment: late_payment,
      early_repayment: early_repayment,
      payment_date: payment_date
    )
  end

  private

  def payment_annual_rate(late_payment: false)
    if late_payment
      late_annual_rate
    else
      annual_rate
    end
  end

  def payment_interest_amount(late_payment: false)
    if late_payment
      monthly_late_interest_payment
    else
      monthly_interest_payment
    end
  end

  def payment_amount(late_payment: false, early_repayment: false)
    if early_repayment
      loan_balance + payment_interest_amount(late_payment: late_payment)
    else
      monthly_principal_payment + payment_interest_amount(late_payment: late_payment)
    end
  end

end
