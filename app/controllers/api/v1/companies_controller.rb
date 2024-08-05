# frozen_string_literal: true

module Api
  module V1
    class CompaniesController < ApplicationController
      def index
        companies = ::CompaniesFilterService.new(filter_params).call
        render json: companies.as_json(include: :deals)
      end

      private

      def filter_params
        params.permit(:name, :industry, :employee_count, :deals_amount, :limit)
      end
    end
  end
end
