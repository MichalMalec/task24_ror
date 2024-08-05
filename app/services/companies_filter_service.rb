# frozen_string_literal: true

class CompaniesFilterService
  def initialize(params)
    @params = params
  end

  def call
    companies = Company.all

    companies = companies.where('name LIKE ?', "%#{param(:name)}%") if param(:name)

    companies = companies.where('industry LIKE ?', "%#{param(:industry)}%") if param(:industry)

    companies = companies.where('employee_count >= ?', param(:employee_count).to_i) if param(:employee_count)

    companies = companies.where('deals_amount >= ?', param(:deals_amount).to_i) if param(:deals_amount)

    companies = companies.limit(param(:limit).to_i) if param(:limit)

    companies.includes(:deals).order(created_at: :desc)
  end

  private

  def param(key)
    @params&.fetch(key, nil)
  end
end
