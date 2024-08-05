require 'rails_helper'

RSpec.describe Company, type: :model do
    describe 'deals_amount' do
        let(:company) { create(:company) }

        it "displays deals_amount of all deals related to company" do
            deal_1 = create(:deal, company: company, amount: 100)
            deal_2 = create(:deal, company: company, amount: 200)

            expect(company.deals_amount).to eq(300)
        end

        it "displays correct deals_amount of company after updating a deal" do
            deal = create(:deal, company: company, amount: 100)
            expect(company.deals_amount).to eq(100)

            deal.update(amount: 500)
            expect(company.deals_amount).to eq(500)
        end

        it "displays correct deals_amount of company after deleting a deal" do
            deal_1 = create(:deal, company: company, amount: 100)
            deal_2 = create(:deal, company: company, amount: 200)
            expect(company.deals_amount).to eq(300)

            deal_1.destroy
            expect(company.deals_amount).to eq(200)
        end
    end
end