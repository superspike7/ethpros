FactoryBot.define do
  factory :stock_transaction do
    association :user, factory: :user
    association :stock, factory: :stock
    amount { 69 }
  end
end
