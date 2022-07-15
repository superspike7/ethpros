FactoryBot.define do
  factory :transaction do
    association :user, factory: :user
    association :stock, factory: :stock
    amount { 69 }
    transaction_type { 'buy' }
  end
end
