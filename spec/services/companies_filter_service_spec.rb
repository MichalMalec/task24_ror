require 'rails_helper'

RSpec.describe CompaniesFilterService do
    describe "#call" do 
        let!(:company_1) { create(:company, name: "First Company", employee_count: 10, deals_amount: 100) }
        let!(:company_2) { create(:company, name: "Second Company", employee_count: 20, deals_amount: 200) }
        let!(:company_3) { create(:company, name: "Third Company", employee_count: 30, deals_amount: 300, industry: "Exemplary industry") }

        context "when filtering by name" do
            it "returns companies with matching names" do
                result = CompaniesFilterService.new(name: "Third").call

                expect(result).to match_array([company_3])
            end
        end

        context "when filtering by industry" do
            it "returns companies with matching industry" do
                result = CompaniesFilterService.new(industry: "Exemplary").call

                expect(result).to match_array([company_3])
            end
        end

        context "when filtering by employee_count" do
            it "returns companies with minimal employee_count" do
                result = CompaniesFilterService.new(employee_count: 11).call

                expect(result).to match_array([company_2, company_3])
            end
        end

        context "when filtering by deals_amount" do
            it "returns companies with minimal deals_amount" do
                result = CompaniesFilterService.new(deals_amount: 201).call

                expect(result).to match_array([company_3])
            end
        end

        context "when limitieng companies count" do
            it "returns requested limit of companies" do
                result = CompaniesFilterService.new(limit: 1).call

                expect(result.count).to eq(1)
            end
        end
    end
end