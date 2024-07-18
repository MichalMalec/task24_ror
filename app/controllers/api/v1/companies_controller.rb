class Api::V1::CompaniesController < ApplicationController
  def index
    companies = ::CompaniesFilterService.new(filter_params).call
    render json: companies.as_json(include: :deals)
  end

  private

  def filter_params
    params.permit(:name, :industry, :employee_count, :limit, :deal_amount)
  end
end
