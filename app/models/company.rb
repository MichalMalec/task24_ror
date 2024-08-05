# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :deals

  def update_deals_amount!
    update_columns(deals_amount: deals.sum(:amount))
  end
end
