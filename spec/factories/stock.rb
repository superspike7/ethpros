FactoryBot.define do
  factory :stock do
    symbol { "AAPL" }
    company_name { "Apple Inc" }
    price { 145.61 }
  end
end
