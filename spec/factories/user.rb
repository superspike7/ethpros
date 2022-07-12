FactoryBot.define do
  factory :user do
    email { 'johndoe@example.com' }
    password { 'fakepassword123' }
    confirmed_at { Time.now }
  end
end
