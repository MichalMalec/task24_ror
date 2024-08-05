# frozen_string_literal: true

require 'factory_bot_rails'

namespace :company_deals_populer do
  desc 'Populate db with huge amount of companies and associated deals'
  task seed_company_deals: :environment do
    FactoryBot.reload

    num_companies = 30_000
    deals_per_company = 5

    puts 'Start seeding'
    num_companies.times do |_i|
      company = FactoryBot.create(:company)
      FactoryBot.create_list(:deal, deals_per_company, company:)
    end

    puts 'Seeding process has finished.'
    puts "#{num_companies} companies with #{deals_per_company} deals per each company has been created."
  end
end
