FactoryBot.define do
  factory :user do
    full_name { 'John Doe' }
    email { Faker::Internet.email }
    password { 'password123' }
    password_confirmation { 'password123' }
  end
end
