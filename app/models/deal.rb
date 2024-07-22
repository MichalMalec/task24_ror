class Deal < ApplicationRecord
  belongs_to :company

  after_commit :update_company_deals_amount

  private

  def update_company_deals_amount
    company.update_deals_amount!
  end
end
