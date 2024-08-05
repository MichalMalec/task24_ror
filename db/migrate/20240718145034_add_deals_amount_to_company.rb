# frozen_string_literal: true

class AddDealsAmountToCompany < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :deals_amount, :decimal

    say_with_time 'Update deals_amount for companies' do
      Company.find_each(&:update_deals_amount!)
    end
  end
end
