# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    industry { Faker::Company.industry }
    employee_count { Faker::Number.between(from: 1, to: 500) }

    deals_amount { 0 }

    created_at { Faker::Time.backward(days: 365) }
    updated_at { Faker::Time.backward(days: 1) }
  end
end
