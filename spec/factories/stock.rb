FactoryBot.define do
  factory :stock do
    symbol { "AAPL" }
    company_name { "Apple Inc" }
    latest_price { 145.61 }
    change_percent_s { "+1.98%" }
    iex_volume { 1595221 }
    change { 2.64 }
    latest_time { "July 5, 2022" }
  end
end
